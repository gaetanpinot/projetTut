import { Component } from '@angular/core';
import { AuthStoreService } from '../../../Services/store/AuthStore.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-connexion-inscrip',
  standalone: false,
  templateUrl: './connexion-inscrip.component.html',
  styleUrls: ['./connexion-inscrip.component.scss']
})
export class ConnexionInscripComponent {
  activeTab: 'login' | 'signup' = 'login';
  token$: Observable<string | null>;

  constructor(protected authStore: AuthStoreService) {
    this.token$ = this.authStore.token$; // Assurez-vous que `token$` est un observable
  }

  switchTab(tab: 'login' | 'signup'): void {
    this.activeTab = tab;
  }
}
