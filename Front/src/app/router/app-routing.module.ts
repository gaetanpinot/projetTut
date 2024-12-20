import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TestHomeComponent } from '../Components/TEST/test-home/test-home.component';
import { NextPageComponent } from '../Components/TEST/test-home/next-page/next-page.component';
import { ConnexionInscripComponent } from '../Components/Main/connexion-inscrip/connexion-inscrip.component';
import { HomeComponent } from '../Components/Main/home/home.component';
import { DeconnexionComponent } from '../Components/Main/connexion-inscrip/deconnexion/deconnexion.component';


const routes: Routes = [
  { path: '', redirectTo: 'Home', pathMatch: 'full'},
  { path: 'TEST', component: TestHomeComponent },
  { path: 'Home', component: HomeComponent },
  { path: 'next', component: NextPageComponent },
  { path: 'Connexion', component: ConnexionInscripComponent },  
  { path: 'Deconnexion', component: DeconnexionComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)], 
  exports: [RouterModule] 
})
export class AppRoutingModule { }