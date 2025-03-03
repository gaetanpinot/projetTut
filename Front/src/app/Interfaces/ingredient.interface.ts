export interface Ingredient {
  id: number,
  nom: string,
  debut_saison: number,
  fin_saison: number,
  url_photo: string,
  check: boolean
}
export interface IngredientQuantite {
  quantite: string,
  ingredient: Ingredient
}
export interface IngredientInput {
  id: number,
  quantite: string
}
export interface IngredientProduit {
  id: string,
  nom: string,
  ingredients: Ingredient[]
}

export interface IngredientFrigo {
  id_ingredient: number,
  nom: string,
  url_photo: string,
  quantite: string,
  date_ajout: string
}
export interface FrigoInput {
  frigo: IngredientFrigoInput[]
}
export interface IngredientFrigoInput {
  id: number,
  quantite: string,
  timestamp_ajout: number,
}

