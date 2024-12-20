export interface SignInRequestBody{
    "nom_utilisateur": string,  
    "mot_de_passe": string,  
    "role": number  
}

export interface LogInRequestBody{
    "nom_utilisateur": string,  
    "mot_de_passe": string,   
}

export interface LogSignInResponse{
    "utilisateur": {
        "id": string,
        "nomUtilisateur": string,
        "role": number
    },
    "token": string
}