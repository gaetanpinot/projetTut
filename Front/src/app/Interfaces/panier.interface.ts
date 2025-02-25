import { Ingredient, IngredientInput, IngredientQuantite } from "./ingredient.interface";

export interface PanierInput {
  ingredients: IngredientInput[]
}
export interface PanierResponse {
  panier: Panier
}

export interface PaniersResponse {
  paniers: Panier[]
}
export interface Panier {
  id: number,
  id_producteur: string,
  date_publication: string,
  ingredients: IngredientQuantite[],
}
