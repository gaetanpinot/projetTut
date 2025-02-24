import {Component, OnInit} from '@angular/core';
import {RecetteService} from '../../../Services/recette.service';
import {MatTableDataSource} from '@angular/material/table';
import {GetRecetteResponse, Ingredient, Recette, Tag} from '../../../Interfaces/recette.interface';
import {ActivatedRoute} from '@angular/router';

@Component({
  selector: 'app-recette',
  standalone: false,

  templateUrl: './recette.component.html',
  styleUrl: './recette.component.scss'
})
export class RecetteComponent implements  OnInit {

  nom: string | undefined;
  temps_preparation: number | undefined;
  description: string | undefined;
  url_photo: string | undefined;
  tags: Tag[] | undefined;
  ingredients: Ingredient[] | undefined;


  constructor(private recetteService: RecetteService, private route: ActivatedRoute)
  {}

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      let id = params.get('id');
      this.loadRecette(Number(id));
    });

  }

  private loadRecette(id: number) {
    this.recetteService.getRecetteById(id).subscribe({
      next: (data) => {
        //console.log(data)
        this.nom = data.nom;
        this.temps_preparation = data.temps_preparation;
        this.description = data.description;
        this.url_photo = data.url_photo;

        this.tags = data.tags;
        this.ingredients = data.ingredients;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }
}
