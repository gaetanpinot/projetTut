import {Component, OnInit} from '@angular/core';
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

  switchTheme(event: any){
    switchTheme();
  }
}
