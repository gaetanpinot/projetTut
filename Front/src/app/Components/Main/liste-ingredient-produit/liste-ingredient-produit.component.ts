import { Component, Input } from '@angular/core';
import { Ingredient, IngredientProduit } from '../../../Interfaces/ingredient.interface';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { UtilisateurService } from '../../../Services/utilisateur.service';
import { Router } from '@angular/router';
import { Producteur } from '../../../Interfaces/utilisateur.interface';

@Component({
  selector: 'app-liste-ingredient-produit',
  standalone: false,

  templateUrl: './liste-ingredient-produit.component.html',
  styleUrl: './liste-ingredient-produit.component.scss'
})
export class ListeIngredientProduitComponent {
  @Input() id: string = '';
  public ingredients_produit: IngredientProduit = Object();

  public get isAbonne(): boolean {
    return this.producteursUtilisateurConnectee.some((producteur) => producteur.id === this.id);
  }

  producteursUtilisateurConnectee: Producteur[] = [];

  desabonneProducteur(): void {

    this.utilisateurService.desabonneProducteur(this.id).subscribe({
      next: () => {
        this.loadProducteursUtilisateurConnectee();
      },
      error: (err) => {
        console.error(err);
      }
    });
  }

  loadProducteursUtilisateurConnectee(): void {
    this.utilisateurService.getProducteursUtilisateurConnectee().subscribe({
      next: (data) => {
        this.producteursUtilisateurConnectee = data.producteurs;
        this.loadProducteursUtilisateurConnectee()
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

  constructor(private ingredientService: IngredientsServicesService,
    private utilisateurService: UtilisateurService,
    private router: Router,
  ) { }

  ngOnInit(): void {
    this.loadProducteursUtilisateurConnectee();
    //  this.loadIngredients();
  }

  ngOnChanges(): void {
    this.loadIngredients();
  }

  ngOnDestroy(): void {
    this.ingredients_produit = Object();
  }

  loadIngredients(): void {
    if (this.id === '')
      return;
    this.ingredientService.getIngredientsProduit(this.id).subscribe({
      next: (data) => {
        console.log(data);
        this.ingredients_produit = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

  abonnerAProducteur(): void {
    this.utilisateurService.abonnerProducteur(this.id).subscribe({
      next: (data) => {
        this.router.navigate(['/']);
      },
      error: (err) => {
        console.error(err);
      }
    })
  }
}
