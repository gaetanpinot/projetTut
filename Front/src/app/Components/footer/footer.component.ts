import { Component, OnInit } from '@angular/core';
import { switchTheme } from '../../shared/functions/switchTheme';
import {AuthStoreService} from '../../Services/store/AuthStore.service';

@Component({
  selector: 'footer-component',
  standalone: false,

  templateUrl: './footer.component.html',
  styleUrl: './footer.component.scss'
})

export class FooterComponent implements OnInit {

  constructor(protected authStore: AuthStoreService)
  {}

  ngOnInit() {

  }

}


