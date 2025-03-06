import { ChangeDetectionStrategy, Component, OnInit, Output, EventEmitter, Inject } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { Ingredient, IngredientFrigo, IngredientFrigoInput } from '../../../Interfaces/ingredient.interface';
import { UtilisateurService } from '../../../Services/utilisateur.service';
import { FrigoInput } from '../../../Interfaces/ingredient.interface';
import { MatSnackBar } from '@angular/material/snack-bar';
import {
  MAT_DIALOG_DATA,
  MatDialog,
  MatDialogActions,
  MatDialogClose,
  MatDialogContent,
  MatDialogRef,
  MatDialogTitle,
} from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { inject } from '@angular/core/testing';
import { DatePipe } from '@angular/common';
import { firstValueFrom } from 'rxjs';
@Component({
  selector: 'app-frigo',
  standalone: false,
  templateUrl: './frigo.component.html',
  styleUrls: ['./frigo.component.scss']
})
export class FrigoComponent implements OnInit {
  frigoUtilisateur: IngredientFrigo[] = [];
  ingredients: Ingredient[] = [];
  frigoForm: FormGroup;
  public isPanierModifiee: boolean = false;

  get formdata(): FormGroup {
    const today = this.formatDateForInput(new Date());

    return this.fb.group({
      quantite: ['', [Validators.required, Validators.minLength(1)]],
      id: ['', Validators.required],
      date_ajout: [today, Validators.required]
    });
  }

  public async dialogFrigoNonSauvegardee(): Promise<boolean> {
    const promise = firstValueFrom(this.dialog.open(DialogFrigoNonSauvegardee,
      {
        width: '20em',
      }
    ).afterClosed())
    let doExit: boolean = false;
    await promise.then((result) => {
      switch (result) {
        case "dontexit":
          break;
        case "save":
          this.enregistrerFrigo()
          doExit = true;
          break;
        case "dontsave":
          doExit = true;
          break;
      }
    })
    return doExit;
  }

  constructor(
    private ingredientService: IngredientsServicesService,
    private fb: FormBuilder,
    private utilisateurService: UtilisateurService,
    private snackBar: MatSnackBar,
    private dialog: MatDialog,
    private datePipe: DatePipe,
  ) {
    this.frigoForm = this.fb.group({
      ingredients: this.fb.array([
        this.formdata
      ])
    });
  }

  get ingredientsFormArray(): FormArray<any> {
    return this.frigoForm.controls["ingredients"] as FormArray<any>;
  }

  get ingredientsFormArrayControls() {
    return this.ingredientsFormArray.controls as FormGroup[];
  }

  addIngredient() {
    this.isPanierModifiee = true;
    const ingredient = this.formdata;
    this.ingredientsFormArray.push(ingredient);
  }

  deleteIngredient(index: number) {
    this.isPanierModifiee = true;
    this.ingredientsFormArray.removeAt(index);
  }

  ngOnInit(): void {
    this.loadIngredients();
    this.loadFrigo();
  }

  loadIngredients(): void {
    this.ingredientService.getIngredients().subscribe({
      next: (data) => {
        this.ingredients = data;
      },
      error: (err) => {
        console.error('Erreur lors du chargement des ingrédients', err);
      }
    });
  }

  // Format date as YYYY-MM-DD for input field
  formatDateForInput(date: Date): string {
    const transformedDate = this.datePipe.transform(date, 'yyyy-MM-ddTHH:mm')
    return transformedDate ? transformedDate : '';
  }

  formatApiDateForInput(dateString: string): string {
    const date = new Date(dateString);
    return this.formatDateForInput(date);
  }

  convertDateToTimestamp(dateString: string): number {
    const date = Date.parse(dateString);
    return Math.floor(date / 1000);
  }

  loadFrigo(): void {
    this.utilisateurService.getFrigo().subscribe({
      next: (data) => {
        this.frigoUtilisateur = data;
        while (this.ingredientsFormArray.length !== 0) {
          this.ingredientsFormArray.clear()
        }

        if (data.length === 0) {
          this.ingredientsFormArray.push(this.formdata);
        } else {
          data.forEach(ingredient => {
            const formattedDate = this.formatApiDateForInput(ingredient.date_ajout);
            const ingredientForm = this.fb.group({
              quantite: [ingredient.quantite, [Validators.required, Validators.minLength(1)]],
              id: [ingredient.id_ingredient, Validators.required],
              date_ajout: [formattedDate, Validators.required]
            });
            this.ingredientsFormArray.push(ingredientForm);
          });
        }
      },
      error: (err) => {
        console.error('Erreur lors du chargement du frigo', err);
        this.snackBar.open('Erreur lors du chargement du frigo', 'Fermer', {
          duration: 10000
        });
      }
    });
  }

  checkDuplicateFrigoIngredient() {
    this.frigoForm.value.ingredients.reduce((acc: any, curr: any) => {
      if (!acc.hasOwnProperty(curr.id)) {
        acc[curr.id] = [curr.date_ajout];
        return acc;
      }
      console.log(acc[curr.id]);
      if (acc[curr.id].includes(curr.date_ajout)) {
        const ing = this.ingredients.find(ingredient => ingredient.id === curr.id);
        const nom = ing ? ing.nom : curr.id;
        throw new Error("L'ingredient: " + nom + " existe déjà avec la date d'ajout: " + curr.date_ajout);
      }
      acc[curr.id].push(curr.date_ajout);
      return acc;
    }, {});
  };

  async enregistrerFrigo() {
    console.log("enregistrer frigo");
    try {
      this.checkDuplicateFrigoIngredient();
    } catch (e: any) {
      this.snackBar.open(e.message, 'Fermer', {
        duration: 10000
      });
      return;
    }

    const frigoData = this.frigoForm.value.ingredients.map((item: any) => {
      const timestamp = this.convertDateToTimestamp(item.date_ajout);
      return {
        id: item.id,
        quantite: item.quantite,
        timestamp_ajout: timestamp
      };
    });

    const frigoInput: FrigoInput = { frigo: frigoData };
    console.log("frigo update:", frigoInput);

    await firstValueFrom(this.utilisateurService.remplacerFrigo(frigoInput)).then(
      (data) => {
        this.frigoUtilisateur = data;
        this.isPanierModifiee = false;
        this.snackBar.open('Frigo mis à jour avec succès', 'Fermer', {
          duration: 10000
        });
        console.log('Frigo mis à jour avec succès', data);
      }).catch(
        (err) => {
          this.snackBar.open('Erreur lors de la mise à jour du frigo', 'Fermer', {
            duration: 10000
          });
          console.error('Erreur lors de la mise à jour du frigo', err);
        }
      );
  }

  public changementFrigo() {
    console.log("changement frigo");
    this.isPanierModifiee = true;
  }


}

@Component({
  imports: [MatButtonModule, MatDialogActions, MatDialogClose, MatDialogTitle, MatDialogContent],
  template: `
 <h2 mat-dialog-title>Frigo non sauvegardée</h2>
<mat-dialog-content>
Vous avez des modifications non sauvegardées dans votre frigo. Voulez vous sauvegarder avant de quitter la page?
</mat-dialog-content>
<mat-dialog-actions>
  <button id="non" mat-button mat-dialog-close class="text-red-100" (click)="nePasSauvegarder()">Non</button>
  <button id="oui" mat-button mat-dialog-close cdkFocusInitial (click)="sauvegarder()">Oui</button>
  <button id="dontexit" mat-button mat-dialog-close cdkFocusInitial (click)="dontexit()">Ne pas quitter la page</button>
</mat-dialog-actions>
  `,
  styles: `
#non{color:red;}
#oui{color:green;}
  `,
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class DialogFrigoNonSauvegardee {
  constructor(
    public dialogRef: MatDialogRef<DialogFrigoNonSauvegardee>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) { }
  public dontexit() {
    this.dialogRef.close("dontexit");
  }
  public sauvegarder() {
    this.dialogRef.close("save");
  }
  public nePasSauvegarder() {
    this.dialogRef.close("dontsave");
  }
}
