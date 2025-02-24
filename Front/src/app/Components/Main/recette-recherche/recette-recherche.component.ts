import { Component, OnInit } from '@angular/core';
import { RecetteService } from '../../../Services/recette.service';
import { GetRecetteResponse } from '../../../Interfaces/recette.interface';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'app-recette-recherche',
  standalone: false,

  templateUrl: './recette-recherche.component.html',
  styleUrl: './recette-recherche.component.scss'
})
export class RecetteRechercheComponent implements OnInit {

  currentPage: number = 1;
  maxPage: number = 10;

  displayedColumns = ['IMAGE', 'NOM','DESCR', 'CONFIRM'];
  dataSource: MatTableDataSource<GetRecetteResponse> = new MatTableDataSource();

  constructor(private recetteService: RecetteService)
  {}

  ngOnInit(): void {
    this.loadRecettes();
  }

  searchByName(event: Event) {
    const inputValue = (event.target as HTMLInputElement).value;
    this.recetteService.getRecettesByName(inputValue).subscribe({
      next: (data) => {
        console.log(data);
        this.dataSource.data = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

  loadRecettes(): void {
    this.recetteService.getRecettes(this.currentPage).subscribe({
      next: (data) => {
        console.log(data);
        this.dataSource.data = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

  setPage(value: number): void {
    if(this.currentPage + value < 1 || this.currentPage + value > this.maxPage)
      return;

    this.currentPage += value;
    this.loadRecettes();
  }

}
