import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormArray } from '@angular/forms';
import {Recette} from '../../../Interfaces/recette.interface';

@Component({
  selector: 'app-create-recette',
  standalone: false,

  templateUrl: './create-recette.component.html',
  styleUrl: './create-recette.component.scss'
})
export class CreateRecetteComponent {
  recetteForm: FormGroup;

  constructor(private fb: FormBuilder) {
    this.recetteForm = this.fb.group({
      nom: [''],
      temps_preparation: [0],
      complexite: [0],
      description: [''],
      id_createur: [''],
      debut_saison: [null],
      fin_saison: [null],
      id_recette_parente: [0],
      url_photo: [''],
      note: [0],
      tags: this.fb.array([]),
      ingredients: this.fb.array([]),
      ustensiles: this.fb.array([]),
    });
  }

  ngOnInit(): void {}

  get tags(): FormArray {
    return this.recetteForm.get('tags') as FormArray;
  }

  get ingredients(): FormArray {
    return this.recetteForm.get('ingredients') as FormArray;
  }

  get ustensiles(): FormArray {
    return this.recetteForm.get('ustensiles') as FormArray;
  }

  addTag() {
    const tagGroup = this.fb.group({
      id: [0],
      label: [''],
    });
    this.tags.push(tagGroup);
  }

  addIngredient() {
    const ingredientGroup = this.fb.group({
      quantite: [''],
      ingredient: this.fb.group({
        id_ingredient: [0],
        url_photo: [''],
        nom: [''],
      }),
    });
    this.ingredients.push(ingredientGroup);
  }

  addUstensile() {
    const ustensileGroup = this.fb.group({
      id_ustensile: [0],
      quantite: [0],
    });
    this.ustensiles.push(ustensileGroup);
  }

  onSubmit() {
    console.log(this.recetteForm.value);
  }
}
