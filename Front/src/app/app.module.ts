import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HomeComponent } from './Components/TEST/home/home.component';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './router/app-routing.module';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { DialogComponent } from './Components/TEST/home/dialog/dialog.component';
import { MatDialogModule } from '@angular/material/dialog';
import { NextPageComponent } from './Components/TEST/home/next-page/next-page.component';
import { TestService } from './Services/test.service';
import { provideHttpClient } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { MatTableModule } from "@angular/material/table";
import { MatSelectModule } from '@angular/material/select';
import { HeaderComponent } from './Components/header/header.component';
import { FooterComponent } from './Components/footer/footer.component';
import { RecetteRechercheComponent } from './Components/Main/recette-recherche/recette-recherche.component';
import { FrigoComponent } from './Components/Main/frigo/frigo.component';
import { PanierComponent } from './Components/Main/panier/panier.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    DialogComponent,
    NextPageComponent,
    HeaderComponent,
    FooterComponent,
    RecetteRechercheComponent,
    FrigoComponent,
    PanierComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MatCardModule,
    MatButtonModule,
    MatDialogModule, 
    BrowserAnimationsModule,
    FormsModule,
    MatTableModule,
    MatSelectModule,
    MatDialogModule,
  ],
  providers: [
    provideAnimationsAsync(),
    provideHttpClient(),
    TestService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
