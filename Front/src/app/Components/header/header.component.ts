import {Component, OnInit} from '@angular/core';
import { isAuth } from '../../shared/functions/isAuth';
import { switchTheme } from '../../shared/functions/switchTheme';


@Component({
  selector: 'header-component',
  standalone: false,

  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent implements OnInit {

  ngOnInit() {

  }

  isAuthenticated(): boolean{
    return isAuth();
  }

  switchTheme(event: any){
    switchTheme();
  }
}
