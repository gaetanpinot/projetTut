import { Component, EventEmitter, Output } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { Router } from '@angular/router';

import { Ingredient, IngredientInput } from '../../../Interfaces/ingredient.interface';
import { MatFormField } from '@angular/material/form-field';
import { MatSelect } from '@angular/material/select';

@Component({
  selector: 'app-input-ingredient-quantite',
  standalone: false,

  templateUrl: './input-ingredient-quantite.component.html',
  styleUrl: './input-ingredient-quantite.component.scss'
})
export class InputIngredientQuantiteComponent {
  @Output() ingredientQuantiteUpdated = new EventEmitter<IngredientInput[]>();

  handleChangeList() {
    if (!this.ingredientsForm.valid) return;
    const ingredients: IngredientInput[] = this.ingredientsFormArray.map((ingredient) => ({
      "id": ingredient.get('id')?.value,
      "quantite": ingredient.get('quantite')?.value
    })
    );
    this.ingredientQuantiteUpdated.emit(ingredients);
    //console.log(ingredients);
  }

  get formdata(): FormGroup {
    return this.fb.group({
      quantite: ['', [Validators.required, Validators.minLength(1)]],
      id: ['', Validators.required]
    })
  }

  constructor(private ingredientService: IngredientsServicesService,
    private fb: FormBuilder,
  ) {

    this.ingredientsForm =
      this.fb.array([
        this.formdata
      ])
  }

  public ingredients: Ingredient[] = [];

  public ingredientsForm: FormArray<any>;

  public get ingredientsFormArray() {
    return this.ingredientsForm.controls as FormGroup[];
  }

  addIngredient() {
    const ingredient = this.formdata;
    this.ingredientsForm.push(ingredient);
  }

  deleteIngredient(index: number) {
    this.ingredientsForm.removeAt(index);
    this.handleChangeList()
  }

  ngOnInit(): void {
    this.loadIngredients();
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
