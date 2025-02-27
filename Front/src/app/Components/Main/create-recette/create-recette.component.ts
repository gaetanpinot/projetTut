import { Component } from '@angular/core';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { RecetteService } from '../../../Services/recette.service';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-create-recette',
  standalone: false,

  templateUrl: './create-recette.component.html',
  styleUrl: './create-recette.component.scss'
})
export class CreateRecetteComponent {
  constructor(
    private ingredientService: IngredientsServicesService,
    private recetteService: RecetteService,
    private fb: FormBuilder,
  ) {
  }
}
