import { Component } from '@angular/core';
import { Panier, PanierResponse, PaniersResponse } from '../../../Interfaces/panier.interface';
import { PanierService } from '../../../Services/panier.service';
import { NavigationEnd, Router } from '@angular/router';
import { Subject, takeUntil } from 'rxjs';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-liste-panier',
  standalone: false,

  templateUrl: './liste-panier.component.html',
  styleUrl: './liste-panier.component.scss'
})
export class ListePanierComponent {
  public paniers: Panier[] = [];

  constructor(private panierService: PanierService,
    private router: Router,
    private snackBar: MatSnackBar
  ) { }

  private loadPanier() {
    this.panierService.getPaniers().subscribe(
      {
        next: (data) => {
          this.paniers = data.paniers;
        },
        error: (err) => {
          console.error(err);
        }
      }
    );
  }

  public publierPanier(id: number) {
    this.panierService.publierPanier(id).subscribe(
      (res: Response) => {
        if (res.status !== 201) {
          this.snackBar.open('Erreur lors de la publication du panier', 'Fermer', {
            duration: 10000
          })
          return;
        }
        this.loadPanier();
        this.snackBar.open('Panier publié', 'Fermer', {
          duration: 10000
        })

      }
    );
  }
  test() {
    this.snackBar.open('Panier publié', 'Fermer', {
      duration: 1000
    })
  }

  ngOnInit(): void {
    this.paniers = [];
    this.loadPanier();
  }

  ngOnDestroy(): void {
    this.paniers = [];
  }

}
