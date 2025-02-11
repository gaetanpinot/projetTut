import { Component } from '@angular/core';
import { isAuth } from '../../../shared/functions/isAuth';
import { AuthStoreService } from '../../../Services/store/AuthStore.service';
@Component({
  selector: 'app-connexion-inscrip',
  standalone: false,
  
  templateUrl: './connexion-inscrip.component.html',
  styleUrl: './connexion-inscrip.component.scss'
})
export class ConnexionInscripComponent {
  activeTab: 'login' | 'signup' = 'login';

  constructor(protected authStore: AuthStoreService)
  {}

  switchTab(tab: 'login' | 'signup'): void {
    console.log(this.authStore.getToken())
    this.activeTab = tab;
  }
}
