import { Ingredient, IngredientFrigo } from "./ingredient.interface"

export interface Producteur {
  nom_utilisateur: string,
  id: string,
}
export interface Utilisateur {
  id: string,
  nom_utilisateur: string,
  role: number
}
export interface Profile {
  utilisateur: Utilisateur,
  allergies: Allergie[],
  ingredients_exclus: Ingredient[],
  frigo: IngredientFrigo[],
}

export interface Allergie {
  id: number,
  label: string,
  check: boolean
}
