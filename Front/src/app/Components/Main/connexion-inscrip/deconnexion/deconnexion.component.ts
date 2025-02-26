import { Component, OnInit } from '@angular/core';
import { AuthStoreService } from '../../../../Services/store/AuthStore.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-deconnexion',
  standalone: false,
  templateUrl: './deconnexion.component.html',
  styleUrls: ['./deconnexion.component.scss']
})
export class DeconnexionComponent implements OnInit {

  constructor(private authStore: AuthStoreService, private router: Router) {}

  ngOnInit(): void {
    this.authStore.clearUser();

    // Ajout d'un léger délai avant la redirection pour un effet plus fluide
    setTimeout(() => {
      this.router.navigate(['/']);
    }, 1000);
  }
}
