import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './router/app-routing.module';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { DialogComponent } from './Components/TEST/test-home/dialog/dialog.component';
import { MatDialogModule } from '@angular/material/dialog';
import { NextPageComponent } from './Components/TEST/test-home/next-page/next-page.component';
import { TestService } from './Services/test.service';
import { provideHttpClient } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatTableModule } from "@angular/material/table";
import { MatSelectModule } from '@angular/material/select';
import { HeaderComponent } from './Components/header/header.component';
import { FooterComponent } from './Components/footer/footer.component';
import { RecetteRechercheComponent } from './Components/Main/recette-recherche/recette-recherche.component';
import { FrigoComponent } from './Components/Main/frigo/frigo.component';
import { PanierComponent } from './Components/Main/panier/panier.component';
import { ConnexionInscripComponent } from './Components/Main/connexion-inscrip/connexion-inscrip.component';
import { TestHomeComponent } from './Components/TEST/test-home/test-home.component';
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
import {RecetteComponent} from './Components/Main/recette/recette.component';

// @ts-ignore
@NgModule({
  declarations: [
    AppComponent,
    TestHomeComponent,
    DialogComponent,
    NextPageComponent,
    HeaderComponent,
    FooterComponent,
    RecetteRechercheComponent,
    FrigoComponent,
    PanierComponent,
    ConnexionInscripComponent,
    ConnexionComponent,
    InscriptionComponent,
    DeconnexionComponent,
    CreatePanierComponent,
    RecetteComponent
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
  ],
  providers: [
    provideAnimationsAsync(),
    provideHttpClient(),
    TestService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
