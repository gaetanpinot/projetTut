import { Component, OnInit } from '@angular/core';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { Ingredient, IngredientProduit } from '../../../Interfaces/ingredient.interface';
import { AuthStoreService } from '../../../Services/store/AuthStore.service';
import { UtilisateurService } from '../../../Services/utilisateur.service';
import { firstValueFrom } from 'rxjs';

@Component({
  selector: 'app-production',
  standalone: false,

  templateUrl: './production.component.html',
  styleUrl: './production.component.scss'
})
export class ProductionComponent implements OnInit {

  ingredients: Ingredient[] = [];
  ingredientsProduits: IngredientProduit = Object();

  ingredientsProduitsId: number[] = [];

  constructor(private ingredientsService: IngredientsServicesService,
    private authStore: AuthStoreService,
    private utilisateurService: UtilisateurService
  ) {

  }

  async ngOnInit() {
    await this.loadIngredients();
    console.log("ingredients loadés");
    await this.getIngredientsProduits();
  }

  async loadIngredients() {
    const promise = firstValueFrom(this.ingredientsService.getIngredients());
    await promise.then((data) => {
      this.ingredients = data;
      console.log(this.ingredients);
    }).catch((error) => {
      console.log(error);
    })
  }

  async getIngredientsProduits() {
    let producteurId = this.authStore.getId();
    this.ingredientsService.getIngredientsProduit(producteurId).subscribe({
      next: (data) => {
        this.ingredientsProduits = data;

        for (let i = 0; i < this.ingredients.length; i++) {
          for (let j = 0; j < this.ingredientsProduits.ingredients.length; j++) {
            if (this.ingredients[i].id === this.ingredientsProduits.ingredients[j].id) {
              this.ingredients[i].check = true;
              this.ingredientsProduitsId.push(this.ingredients[i].id);
            }
          }
        }

      }
    });
  }
  changeIngredient(ingre: Ingredient) {
    if (ingre.check) {
      this.addIngredient(ingre.id);
    } else {
      this.deleteIngredient(ingre.id);
    }
    this.utilisateurService.setIngredientProduit(this.ingredientsProduitsId).subscribe({
      next: () => {

      }
    });
  }

  addIngredient(id: number) {
    this.ingredientsProduitsId.push(id);
  }

  deleteIngredient(id: number) {
    for (let i = this.ingredientsProduitsId.length; i--;) {
      if (this.ingredientsProduitsId[i] === id) {
        this.ingredientsProduitsId.splice(i, 1);
      }
    }
  }


}
