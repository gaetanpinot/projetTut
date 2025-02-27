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
  isMenuOpen = false;

  constructor(protected authStore: AuthStoreService) {}

  ngOnInit(): void {}

  toggleMenu(): void {
    this.isMenuOpen = !this.isMenuOpen;
  }

  switchTheme(event: any): void {
    // Ajoutez ici la logique pour changer le thème
  }
}
