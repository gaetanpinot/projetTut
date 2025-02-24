import { Component } from '@angular/core';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { Ingredient } from '../../../Interfaces/ingredient.interface';

@Component({
  selector: 'app-create-panier',
  standalone: false,

  templateUrl: './create-panier.component.html',
  styleUrl: './create-panier.component.scss'
})
export class CreatePanierComponent {
  constructor(private ingredientService: IngredientsServicesService) { }
  public ingredients: Ingredient[] = [];

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
