import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ConnexionInscripComponent } from '../Components/Main/connexion-inscrip/connexion-inscrip.component';
import { HomeComponent } from '../Components/Main/home/home.component';
import { DeconnexionComponent } from '../Components/Main/connexion-inscrip/deconnexion/deconnexion.component';
import { RecetteRechercheComponent } from '../Components/Main/recette-recherche/recette-recherche.component';
import { CreatePanierComponent } from '../Components/Main/create-panier/create-panier.component';
import { FrigoComponent } from '../Components/Main/frigo/frigo.component';
import { RecetteComponent } from '../Components/Main/recette/recette.component';
import { PanierComponent } from '../Components/Main/panier/panier.component';
import { ListePanierComponent } from '../Components/Main/liste-panier/liste-panier.component';
import { ListeIngredientProduitComponent } from '../Components/Main/liste-ingredient-produit/liste-ingredient-produit.component';
import { ListeProducteursComponent } from '../Components/Main/liste-producteurs/liste-producteurs.component';
// import {RecetteComponent} from '../Components/Main/recette/recette.component';
import { AccountComponent } from '../Components/Main/account/account.component';
import { GardeNonSaveGuard } from '../Guard/garde-non-save.guard';

const routes: Routes = [
  { path: '', redirectTo: 'Home', pathMatch: 'full' },
  { path: 'Home', component: HomeComponent },
  { path: 'Connexion', component: ConnexionInscripComponent },
  { path: 'Deconnexion', component: DeconnexionComponent },
  { path: 'Recette', component: RecetteRechercheComponent },
  { path: 'Frigo', component: FrigoComponent, canDeactivate: [GardeNonSaveGuard] },
  { path: 'Nouveau-panier', component: CreatePanierComponent },
  { path: 'panier/user', component: PanierComponent },
  { path: 'panier/create', component: CreatePanierComponent, title: 'Créer un panier' },
  { path: 'panier/liste', component: ListePanierComponent, title: 'Liste des paniers' },
  { path: 'producteurs/:id/ingredients', component: ListeIngredientProduitComponent, title: 'Liste des ingredients du producteur' },
  { path: 'producteurs/liste', component: ListeProducteursComponent, title: 'Liste des producteurs' },
  { path: 'Recette/:id', component: RecetteComponent },
  { path: 'Account', component: AccountComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { bindToComponentInputs: true })],
  providers: [GardeNonSaveGuard],
  exports: [RouterModule]
})
export class AppRoutingModule { }
