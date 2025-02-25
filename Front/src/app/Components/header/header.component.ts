import {Component, OnInit} from '@angular/core';
import { switchTheme } from '../../shared/functions/switchTheme';
import { AuthStoreService } from '../../Services/store/AuthStore.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'header-component',
  standalone: false,

  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent implements OnInit {

  ngOnInit() {

  }
  token$: Observable<string | null>;

  constructor(protected authStore: AuthStoreService) {
    this.token$ = this.authStore.token$; // Assurez-vous que `token$` est un observable
  }

  switchTheme(event: any){
    switchTheme();
  }
}
