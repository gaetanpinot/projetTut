import {Component, OnInit} from '@angular/core';
import {RecetteService} from '../../../Services/recette.service';
import {Recette} from '../../../Interfaces/recette.interface';

@Component({
  selector: 'app-test-home',
  standalone: false,

  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent implements OnInit {

  recettes: Recette[] = [];

  constructor(private recetteService: RecetteService)
  {}

  ngOnInit() {
    this.loadRandomRecettes();
  }

  loadRandomRecettes(): void {
    this.recetteService.getRandomRecettes().subscribe({
      next: (data) => {
        this.recettes = data;
        console.log(data)
      },
      error: (err) => {
        console.error(err);
      }
    })
  }
}
