import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TestHomeComponent } from '../Components/TEST/test-home/test-home.component';
import { NextPageComponent } from '../Components/TEST/test-home/next-page/next-page.component';
import { ConnexionInscripComponent } from '../Components/Main/connexion-inscrip/connexion-inscrip.component';
import { HomeComponent } from '../Components/Main/home/home.component';
import { DeconnexionComponent } from '../Components/Main/connexion-inscrip/deconnexion/deconnexion.component';
import { RecetteRechercheComponent } from '../Components/Main/recette-recherche/recette-recherche.component';
import { CreatePanierComponent } from '../Components/Main/create-panier/create-panier.component';
import { FrigoComponent } from '../Components/Main/frigo/frigo.component';
import { RecetteComponent } from '../Components/Main/recette/recette.component';
import { ListePanierComponent } from '../Components/Main/liste-panier/liste-panier.component';
// import {RecetteComponent} from '../Components/Main/recette/recette.component';


const routes: Routes = [
  { path: '', redirectTo: 'Home', pathMatch: 'full' },
  { path: 'Home', component: HomeComponent },
  { path: 'Connexion', component: ConnexionInscripComponent },
  { path: 'Deconnexion', component: DeconnexionComponent },
  { path: 'Recette', component: RecetteRechercheComponent },
  { path: 'Frigo', component: FrigoComponent },
  { path: 'panier/create', component: CreatePanierComponent, title: 'Créer un panier' },
  { path: 'panier/liste', component: ListePanierComponent, title: 'Liste des paniers' },
  { path: 'Recette/:id', component: RecetteComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
