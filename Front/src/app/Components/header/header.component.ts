import { Component } from '@angular/core';
import { isAuth } from '../../shared/functions/isAuth';

@Component({
  selector: 'header-component',
  standalone: false,
  
  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent {
  isAuthenticated(): boolean{
    return isAuth();
  }
}
