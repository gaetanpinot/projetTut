import {Component, OnInit} from '@angular/core';
import { isAuth, isClient } from '../../shared/functions/isAuth';
import { switchTheme } from '../../shared/functions/switchTheme';
import {AuthStoreService} from '../../Services/store/AuthStore.service';


@Component({
  selector: 'header-component',
  standalone: false,

  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent implements OnInit {

  constructor(protected authStore: AuthStoreService)
  {}

  ngOnInit() {

  }

  isAuthenticated(): boolean{
    return isAuth();
  }

  switchTheme(event: any){
    switchTheme();
  }
  isClientAuth(): boolean{
    return isClient();
  }
}
