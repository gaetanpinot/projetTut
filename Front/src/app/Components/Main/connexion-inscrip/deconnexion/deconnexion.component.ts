import { Component, OnInit } from '@angular/core';
import { AuthStoreService } from '../../../../Services/store/AuthStore.service';

@Component({
  selector: 'app-deconnexion',
  standalone: false,
  
  templateUrl: './deconnexion.component.html',
  styleUrl: './deconnexion.component.scss'
})
export class DeconnexionComponent implements OnInit{

  constructor(private authStore: AuthStoreService){}

  ngOnInit(): void {
    this.authStore.clearUser();
  }

}
