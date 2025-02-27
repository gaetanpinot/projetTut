import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormArray } from '@angular/forms';
import {IngredientsServicesService} from '../../../Services/ingredients.services.service';
import {Ingredient} from '../../../Interfaces/ingredient.interface';
import {Recette, RecetteInput} from '../../../Interfaces/recette.interface';
import {RecetteService} from '../../../Services/recette.service';

@Component({
  selector: 'app-create-recette',
  standalone: false,

  templateUrl: './create-recette.component.html',
  styleUrl: './create-recette.component.scss'
})
export class CreateRecetteComponent {
  recetteForm: FormGroup;

  ingredients: Ingredient[] =  [];

  recetteInput: RecetteInput = Object();

  constructor(private fb: FormBuilder, private ingredientsService: IngredientsServicesService, private recetteService: RecetteService) {
    this.recetteForm = this.fb.group({
      nom: [''],
      temps_preparation: [0],
      complexite: [0],
      description: [''],
      debut_saison: [null],
      fin_saison: [null],
      id_recette_parente: [0],
      url_photo: [''],
      //tags: this.fb.array([]),
      ingredients: this.fb.array([])
    });
  }

  ngOnInit(): void {}

  onSubmit() {

    this.recetteInput.nom = this.recetteForm.get('nom')?.value;
    this.recetteInput.temps_preparation = this.recetteForm.get('temps_preparation')?.value;
    this.recetteInput.complexite = this.recetteForm.get('complexite')?.value;
    this.recetteInput.description = this.recetteForm.get('description')?.value;
    this.recetteInput.debut_saison = this.recetteForm.get('debut_saison')?.value;
    this.recetteInput.fin_saison = this.recetteForm.get('fin_saison')?.value;
    this.recetteInput.id_recette_parente = null;
    this.recetteInput.url_photo = this.recetteForm.get('url_photo')?.value;

    //this.recetteService.createRecette()
  }
}
