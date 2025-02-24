import { Ingredient, IngredientInput } from "./ingredient.interface";

export interface PanierInput {
  ingredients: IngredientInput[]
}
export interface PanierResponse {
  panier: {
    id: number,
    id_producteur: string,
    date_publication: string,
    ingredients: Ingredient[],
  }

}
