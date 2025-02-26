export interface GetRecettes{
    recettes: Recette[],
    links : {
            next : string,
            prev : string
        }
}


export interface GetRecetteResponse{
    id: number,
    nom: string,
    tempsPreparation: number,
    complexite: number,
    idCreateur: string,
    description: string,
    debutSaison: number,
    finSaison: number,
    urlPhoto: string
}

export interface GetIngredientsResponse{
  id: number,
  nom: string,
  url_photo: string
}




export interface Recette{
    id: number,
    nom: string,
    temps_preparation: number,
    complexite: number,
    description: string,
    id_createur : string,
    debut_saison: Date,
    fin_saison: Date,
    id_recette_parente: number,
    url_photo: string,
    note: number,
    tags : [
        {
            id: number,
            label: string
        }
    ],
    ingredients: [
      {
            quantite: string,
            ingredient: {
              id_ingredient: number,
              url_photo: string,
              nom: string
            }

        }
    ],
    ustensiles: [
        {
            id_ustensile: number,
            quantite : number
        }
    ]
}

export interface Tag {
  label: string;
  id: number;
}

export interface Ingredient {
  quantite: string;
  ingredient: IngredientDetail;
}

export interface IngredientDetail {
  id: number;
  nom: string;
  debut_saison: number;
  fin_saison: number;
  url_photo: string;
}

export interface Vegetable {
  nom: string;
  id: number;
  url_photo: string;
}
