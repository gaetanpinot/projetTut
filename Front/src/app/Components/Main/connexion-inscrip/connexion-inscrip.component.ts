import { Component } from '@angular/core';
import { isAuth } from '../../../shared/functions/isAuth';
@Component({
  selector: 'app-connexion-inscrip',
  standalone: false,
  
  templateUrl: './connexion-inscrip.component.html',
  styleUrl: './connexion-inscrip.component.scss'
})
export class ConnexionInscripComponent {
  activeTab: 'login' | 'signup' = 'login';

  isAuthenticated(): boolean{
    return isAuth();
  }

  switchTab(tab: 'login' | 'signup'): void {
    this.activeTab = tab;
  }
}
