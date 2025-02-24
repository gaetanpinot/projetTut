import {Component, OnInit} from '@angular/core';
import { isAuth, isClient } from '../../shared/functions/isAuth';
import { switchTheme } from '../../shared/functions/switchTheme';
<<<<<<< HEAD
=======
import {AuthStoreService} from '../../Services/store/AuthStore.service';
>>>>>>> a557e730a8cbfa6a857dba8090272a79c297e3a7


@Component({
  selector: 'header-component',
  standalone: false,

  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent implements OnInit {

<<<<<<< HEAD
=======
  constructor(protected authStore: AuthStoreService)
  {}

>>>>>>> a557e730a8cbfa6a857dba8090272a79c297e3a7
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
