import { Component } from '@angular/core';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { Ingredient } from '../../../Interfaces/ingredient.interface';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { PanierInput } from '../../../Interfaces/panier.interface';
import { PanierService } from '../../../Services/panier.service';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-create-panier',
  standalone: false,

  templateUrl: './create-panier.component.html',
  styleUrl: './create-panier.component.scss'
})
export class CreatePanierComponent {
  get formdata(): FormGroup {
    return this.fb.group({
      quantite: ['', [Validators.required, Validators.minLength(1)]],
      id: ['', Validators.required]
    })

  }
  constructor(private ingredientService: IngredientsServicesService,
    private fb: FormBuilder,
    private panierService: PanierService,
    private router: Router,
  ) {

    this.panierForm = this.fb.group({
      ingredients: this.fb.array([
        this.formdata
      ])
    });
  }
  public ingredients: Ingredient[] = [];

  panierForm: FormGroup;

  get ingredientsFormArray(): FormArray<any> {
    return this.panierForm.controls["ingredients"] as FormArray<any>;
  }

  get ingredientsFormArrayControls() {
    return this.ingredientsFormArray.controls as FormGroup[];
  }

  addIngredient() {
    const ingredient = this.formdata;
    this.ingredientsFormArray.push(ingredient);
  }

  deleteIngredient(index: number) {
    this.ingredientsFormArray.removeAt(index);
  }

  ngOnInit(): void {
    this.loadIngredients();
  }

  creerPanier() {
    const panier: PanierInput = { ingredients: this.panierForm.value.ingredients };
    console.log("panier create:", panier);
    this.panierService.createPanier(panier).subscribe(
      {
        next: (data) => {
          console.log(data);
        },
        error: (err) => {
          console.error(err);
        }
      }
    )
    this.router.navigateByUrl('/panier/liste');
  }


  loadIngredients(): void {
    this.ingredientService.getIngredients().subscribe({
      next: (data) => {
        this.ingredients = data;
      },
      error: (err) => {
        console.error(err);
      }
    });
  }
}
