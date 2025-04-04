import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './router/app-routing.module';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatDialogModule } from '@angular/material/dialog';
import { provideHttpClient } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatTableModule } from "@angular/material/table";
import { MatSelectModule } from '@angular/material/select';
import { HeaderComponent } from './Components/header/header.component';
import { FooterComponent } from './Components/footer/footer.component';
import { RecetteRechercheComponent } from './Components/Main/recette-recherche/recette-recherche.component';
import { FrigoComponent } from './Components/Main/frigo/frigo.component';
import { ConnexionInscripComponent } from './Components/Main/connexion-inscrip/connexion-inscrip.component';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { ConnexionComponent } from './Components/Main/connexion-inscrip/connexion/connexion.component';
import { InscriptionComponent } from './Components/Main/connexion-inscrip/inscription/inscription.component';
import { MatSliderModule } from '@angular/material/slider';
import { DeconnexionComponent } from './Components/Main/connexion-inscrip/deconnexion/deconnexion.component';
import { MatRadioModule } from '@angular/material/radio';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { CreatePanierComponent } from './Components/Main/create-panier/create-panier.component';
import { RecetteComponent } from './Components/Main/recette/recette.component';
import { ListePanierComponent } from './Components/Main/liste-panier/liste-panier.component';
import { ListeIngredientProduitComponent } from './Components/Main/liste-ingredient-produit/liste-ingredient-produit.component';
import { ListeProducteursComponent } from './Components/Main/liste-producteurs/liste-producteurs.component';
import { AccountComponent } from './Components/Main/account/account.component';
import { HomeComponent } from './Components/Main/home/home.component';
import { CreateRecetteComponent } from './Components/Main/create-recette/create-recette.component';
import { MatDatepickerModule } from '@angular/material/datepicker'; // Import MatDatepickerModule
import { MatNativeDateModule } from '@angular/material/core';
import { InputIngredientQuantiteComponent } from './Components/Main/input-ingredient-quantite/input-ingredient-quantite.component';
import { ProductionComponent } from './Components/Main/production/production.component';
import { DatePipe } from '@angular/common';

@NgModule({
  declarations: [
    AppComponent,
    AccountComponent,
    HeaderComponent,
    FooterComponent,
    RecetteRechercheComponent,
    FrigoComponent,
    ConnexionInscripComponent,
    ConnexionComponent,
    InscriptionComponent,
    DeconnexionComponent,
    CreatePanierComponent,
    RecetteComponent,
    ListePanierComponent,
    ListeIngredientProduitComponent,
    ListeProducteursComponent,
    AccountComponent,
    HomeComponent,
    CreateRecetteComponent,
    InputIngredientQuantiteComponent,
    ProductionComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    MatCardModule,
    MatButtonModule,
    MatDialogModule,
    BrowserAnimationsModule,
    FormsModule,
    MatTableModule,
    MatSelectModule,
    MatDialogModule,
    MatFormFieldModule,
    MatInputModule,
    MatIconModule,
    MatSliderModule,
    MatRadioModule,
    MatCheckboxModule,
    MatSlideToggleModule,
    MatDatepickerModule,
    MatNativeDateModule,
  ],
  providers: [
    provideAnimationsAsync(),
    provideHttpClient(),
    DatePipe,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
