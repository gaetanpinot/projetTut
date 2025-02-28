import { Component, OnInit } from '@angular/core';
import { RecetteService } from '../../../Services/recette.service';
import { GetRecetteResponse, Vegetable } from '../../../Interfaces/recette.interface';
import { MatTableDataSource } from '@angular/material/table';
import { UtilisateurService } from '../../../Services/utilisateur.service';
import { Profile } from '../../../Interfaces/utilisateur.interface';
import { AuthStoreService } from '../../../Services/store/AuthStore.service';
import { Allergie } from '../../../Interfaces/allergies.interface';
import { AllergiesService } from '../../../Services/allergies.service';

@Component({
  selector: 'app-recette-recherche',
  standalone: false,

  templateUrl: './recette-recherche.component.html',
  styleUrl: './recette-recherche.component.scss'
})
export class RecetteRechercheComponent implements OnInit {

  currentPage: number = 1;
  maxPage: number = 10;

  vegetables: Vegetable[] = [];
  bannedvegetables: Vegetable[] = [];
  profileUtilisateur: Profile = Object();
  public allergenes: Allergie[] = [];

  saisons: { id: number; nom: string }[] = [];

  displayedColumns = ['IMAGE', 'NOM', 'DESCR', 'CONFIRM'];
  dataSource: MatTableDataSource<GetRecetteResponse> = new MatTableDataSource();

  constructor(private recetteService: RecetteService,
    private utilisateurService: UtilisateurService,
    public authStore: AuthStoreService,
    private allergieService: AllergiesService,
  ) {
    this.saisons = [
      {
        nom: "Janvier", id: 1
      }, {
        nom: "Février", id: 2
      }, {
        nom: "Mars", id: 3
      }, {
        nom: "Avril", id: 4
      }, {
        nom: "Mai", id: 5
      }, {
        nom: "Juin", id: 6
      }, {
        nom: "Juillet", id: 7
      }, {
        nom: "Août", id: 8
      }, {
        nom: "Septembre", id: 9
      }, {
        nom: "Octobre", id: 10
      }, {
        nom: "Novembre", id: 11
      }, {
        nom: "Décembre", id: 12
      }
    ];

  }



  selectedVegetableIds: number[] = [];
  bannedVegetableIds: number[] = [];
  allergenesId: number[] = [];
  startSaisonId: number = 1;
  endSaisonId: number = 12;

  getSelectedVegetables() {
    return this.vegetables.filter(v => this.selectedVegetableIds.includes(v.id));
  }

  getBannedVegetables() {
    return this.vegetables.filter(v => this.bannedVegetableIds.includes(v.id));
  }


  ngOnInit(): void {
    this.loadRecettes();
    this.loadIngredients();
    this.loadAllergies();
    this.loadProfile();
  }



  //applique les ingredients qu'il y a dans le frigo à la recherche
  appliquerFrigo(load: boolean = true) {
    const ing = this.profileUtilisateur.frigo.map(f => f.id_ingredient);
    this.selectedVegetableIds = ing;
    if (load) this.loadRecettes();
  }

  appliquerAllergenes(load: boolean = true) {
    const allergies = this.profileUtilisateur.allergies.map(f => f.id);
    this.allergenesId = allergies;
    if (load) this.loadRecettes();
  }

  appliquerIngredientsExclus(load: boolean = true) {
    const ing = this.profileUtilisateur.ingredients_exclus.map(f => f.id);
    this.bannedVegetableIds = ing;
    if (load) this.loadRecettes();
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

  loadAllergies() {
    this.allergieService.getAllergies().subscribe({
      next: (data) => {
        this.allergenes = data;
      },
      error: (err) => {
        console.error(err);
      }
    });
  }

  loadRecettes(): void {
    this.recetteService.getRecettes(this.currentPage,
      this.selectedVegetableIds,
      this.bannedVegetableIds,
      this.startSaisonId,
      this.endSaisonId,
      this.allergenesId,
    ).subscribe({
      next: (data) => {
        console.log(data);
        this.dataSource.data = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

  loadIngredients(): void {
    this.recetteService.getIngredients().subscribe({
      next: (data) => {
        console.log(data);
        this.vegetables = data;
        this.bannedvegetables = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

  loadProfile(): void {
    if (!this.authStore.isAuthenticated()) return;
    this.utilisateurService.getProfile().subscribe({
      next: (data) => {
        this.profileUtilisateur = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

  setPage(value: number): void {
    if (this.currentPage + value < 1 || this.currentPage + value > this.maxPage)
      return;

    this.currentPage += value;
    this.loadRecettes();
  }

}
