import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormArray, Validators } from '@angular/forms';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { Ingredient, IngredientInput } from '../../../Interfaces/ingredient.interface';
import { Recette, RecetteInput } from '../../../Interfaces/recette.interface';
import { RecetteService } from '../../../Services/recette.service';

@Component({
  selector: 'app-create-recette',
  standalone: false,

  templateUrl: './create-recette.component.html',
  styleUrl: './create-recette.component.scss'
})
export class CreateRecetteComponent {
  recetteForm: FormGroup;

  ingredients: Ingredient[] = [];

  recetteInput: RecetteInput = Object();

  constructor(private fb: FormBuilder, private ingredientsService: IngredientsServicesService, private recetteService: RecetteService) {
    this.recetteForm = this.fb.group({
      nom: ['', Validators.required],
      temps_preparation: [10, Validators.required],
      complexite: [1, [Validators.required, Validators.min(1), Validators.max(5)]],
      description: ['', Validators.required],
      debut_saison: [null, [Validators.required, Validators.min(1), Validators.max(12)]],
      fin_saison: [null, [Validators.required, Validators.min(1), Validators.max(12)]],
      //id_recette_parente: [0, Validators.required],
      url_photo: ['', Validators.required],
      //tags: this.fb.array([]),
      ingredients: this.fb.array([])
    });
  }

  public saisons = [
    {
      nom: "Janvier", id: 1
    }, {
      nom: "Février", id: 2
    }, {
      nom: "Mars", id: 3
    }, {
      nom: "Avril", id: 4
    }, {
      nom: "Mai", id: 5
    }, {
      nom: "Juin", id: 6
    }, {
      nom: "Juillet", id: 7
    }, {
      nom: "Août", id: 8
    }, {
      nom: "Septembre", id: 9
    }, {
      nom: "Octobre", id: 10
    }, {
      nom: "Novembre", id: 11
    }, {
      nom: "Décembre", id: 12
    }
  ];

  ingredientsInput: IngredientInput[] = [];

  handleChangeIngredients(ingredients: IngredientInput[]) {
    //console.log("create recette", ingredients);
    this.ingredientsInput = ingredients;
  }

  ngOnInit(): void { }

  onSubmit() {

    this.recetteInput.nom = this.recetteForm.get('nom')?.value;
    this.recetteInput.temps_preparation = this.recetteForm.get('temps_preparation')?.value;
    this.recetteInput.complexite = this.recetteForm.get('complexite')?.value;
    this.recetteInput.description = this.recetteForm.get('description')?.value;
    this.recetteInput.debut_saison = this.recetteForm.get('debut_saison')?.value;
    this.recetteInput.fin_saison = this.recetteForm.get('fin_saison')?.value;
    this.recetteInput.id_recette_parente = null;
    this.recetteInput.url_photo = this.recetteForm.get('url_photo')?.value;
    this.recetteInput.ingredients_recette = this.ingredientsInput;

    this.recetteService.createRecette(this.recetteInput).subscribe({ next: () => { } })
  }
}
