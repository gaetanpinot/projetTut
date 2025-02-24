export interface Ingredient {
  id: number,
  nom: string,
  debut_saison: number,
  fin_saison: number,
  url_photo: string
}

export interface IngredientInput {
  id: number,
  quantite: string
}
