import {Component, OnInit} from '@angular/core';
import {RecetteService} from '../../../Services/recette.service';
import {Recette} from '../../../Interfaces/recette.interface';
import {Ingredient} from '../../../Interfaces/ingredient.interface';
import {IngredientsServicesService} from '../../../Services/ingredients.services.service';

@Component({
  selector: 'app-test-home',
  standalone: false,

  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent implements OnInit {

  recettes: Recette[] = [];
  ingredients: Ingredient[] = [];

  constructor(private recetteService: RecetteService, private ingredientsService: IngredientsServicesService)
  {}

  ngOnInit() {
    this.loadRandomRecettes();
    this.loadRandomIngredients();
  }

  loadRandomRecettes(): void {
    this.recetteService.getRandomRecettes().subscribe({
      next: (data) => {
        this.recettes = data;
        console.log(data)
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

  loadRandomIngredients(): void {
    this.ingredientsService.getRandomIngredients().subscribe({
      next: (data) => {
        this.ingredients = data;
        console.log(data)
      },
      error: (err) => {
        console.error(err);
      }
    })
  }
}
