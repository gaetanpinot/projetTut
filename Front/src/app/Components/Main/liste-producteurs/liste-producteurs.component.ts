import { Component } from '@angular/core';
import { UtilisateurService } from '../../../Services/utilisateur.service';
import { Producteur } from '../../../Interfaces/utilisateur.interface';

@Component({
  selector: 'app-liste-producteurs',
  standalone: false,

  templateUrl: './liste-producteurs.component.html',
  styleUrl: './liste-producteurs.component.scss'
})
export class ListeProducteursComponent {
  public producteurs: Producteur[] = [];
  public producteursUtilisateurConnectee: Producteur[] = [];
  constructor(private utilisateurService: UtilisateurService) { }
  ngOnInit(): void {
    this.loadProducteurs();
    this.loadProducteursUtilisateurConnectee();
  }

  isAbonne(id_producteur: string): boolean {
    return this.producteursUtilisateurConnectee.some((producteur) => producteur.id === id_producteur);
  }


  loadProducteursUtilisateurConnectee(): void {
    this.utilisateurService.getProducteursUtilisateurConnectee().subscribe({
      next: (data) => {
        this.producteursUtilisateurConnectee = data.producteurs;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }
  loadProducteurs(): void {
    this.utilisateurService.getProducteurs().subscribe({
      next: (data) => {
        this.producteurs = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }
}
