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

  displayedColumns = ['NOM','DESCR'];
  dataSource: MatTableDataSource<GetRecetteResponse> = new MatTableDataSource();

  constructor(private recetteService: RecetteService)
  {}

  ngOnInit(): void {
    this.recetteService.getRecettes().subscribe({
      next: (data) => {
        console.log(data);
        this.dataSource.data = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

}
