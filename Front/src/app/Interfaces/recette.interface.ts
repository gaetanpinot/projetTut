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




export interface Recette{
    nom: string,  
    temps_preparation: number,  
    complexite: number,  
    description: string,  
    id_createur : string,  
    debut_saison: Date,  
    fin_saison: Date,  
    id_recette_parente: number,  
    tag : [  
        {  
            id_tag: number,  
        }  
    ],  
    ingredients: [  
        {  
            id_ingredient: number,  
            quantite: string  
        }  
    ],  
    ustensiles: [  
        {  
            id_ustensile: number,  
            quantite : number  
        }  
    ]      
}