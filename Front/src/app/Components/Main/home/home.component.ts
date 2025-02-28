import {Component, OnInit} from '@angular/core';
import {RecetteService} from '../../../Services/recette.service';
import {Recette} from '../../../Interfaces/recette.interface';
import {Ingredient} from '../../../Interfaces/ingredient.interface';
import {IngredientsServicesService} from '../../../Services/ingredients.services.service';
import {Panier, PaniersResponse} from '../../../Interfaces/panier.interface';
import {PanierService} from '../../../Services/panier.service';

@Component({
  selector: 'app-test-home',
  standalone: false,

  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent implements OnInit {

  recettes: Recette[] = [];
  ingredients: Ingredient[] = [];
  latestPaniers: PaniersResponse = Object();

  constructor(private recetteService: RecetteService,
              private ingredientsService: IngredientsServicesService,
              private panierService: PanierService
  )
  {}

  ngOnInit() {
    this.loadRandomRecettes();
    this.loadRandomIngredients();
    this.getLatestPaniers();
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

  getLatestPaniers(): void {
    this.panierService.getLatestPaniers().subscribe({
      next: (data) => {
        this.latestPaniers = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }
}
