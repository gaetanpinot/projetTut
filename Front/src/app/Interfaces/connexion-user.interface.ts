export interface SignInRequestBody{
    nom_utilisateur: string | null | undefined,  
    mot_de_passe: string | null | undefined,  
    role: number | null | undefined 
}

export interface LogInRequestBody{
    nom_utilisateur: string | null | undefined,  
    mot_de_passe: string | null | undefined,   
}

export interface LogSignInResponse{
    utilisateur: {
        id: string,
        nomUtilisateur: string,
        role: number
    },
    token: string
}