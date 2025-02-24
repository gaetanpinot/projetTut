import { Component } from '@angular/core';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { Ingredient } from '../../../Interfaces/ingredient.interface';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-create-panier',
  standalone: false,

  templateUrl: './create-panier.component.html',
  styleUrl: './create-panier.component.scss'
})
export class CreatePanierComponent {
  constructor(private ingredientService: IngredientsServicesService, private fb: FormBuilder) {
    this.panierForm = this.fb.group({
      ingredients: this.fb.array([this.fb.control('')])
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
    const ingredient = this.fb.group({
      quantite: ['', Validators.required],
      id_ingredient: ['', Validators.required]
    });
    this.ingredientsFormArray.push(ingredient);
  }

  deleteIngredient(index: number) {
    this.ingredientsFormArray.removeAt(index);
  }

  ngOnInit(): void {
    this.loadIngredients();
  }



  loadIngredients(): void {
    this.ingredientService.getIngredients().subscribe({
      next: (data) => {
        this.ingredients = data;
        console.log(this.ingredients);
      },
      error: (err) => {
        console.error(err);
      }
    });
  }
}
