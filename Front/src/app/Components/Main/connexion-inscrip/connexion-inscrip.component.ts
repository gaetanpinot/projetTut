import { Component } from '@angular/core';

@Component({
  selector: 'app-connexion-inscrip',
  standalone: false,
  
  templateUrl: './connexion-inscrip.component.html',
  styleUrl: './connexion-inscrip.component.scss'
})
export class ConnexionInscripComponent {
  activeTab: 'login' | 'signup' = 'login';

  switchTab(tab: 'login' | 'signup'): void {
    this.activeTab = tab;
  }
}
