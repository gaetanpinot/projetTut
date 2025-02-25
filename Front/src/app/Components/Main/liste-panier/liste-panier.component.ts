import { Component } from '@angular/core';
import { Panier, PanierResponse, PaniersResponse } from '../../../Interfaces/panier.interface';
import { PanierService } from '../../../Services/panier.service';
import { NavigationEnd, Router } from '@angular/router';
import { Subject, takeUntil } from 'rxjs';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'app-liste-panier',
  standalone: false,

  templateUrl: './liste-panier.component.html',
  styleUrl: './liste-panier.component.scss'
})
export class ListePanierComponent {
  public paniers: Panier[] = [];

  private destroy$: Subject<void> = new Subject<void>();
  constructor(private panierService: PanierService, private router: Router) { }

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
      {
        next: () => {
          this.loadPanier();
        },
      }
    );
  }

  ngOnInit(): void {
    this.loadPanier();
  }

  ngOnDestroy(): void {
    this.paniers = [];
  }

}
