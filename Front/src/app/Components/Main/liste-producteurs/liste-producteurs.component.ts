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
  constructor(private utilisateurService: UtilisateurService) { }
  ngOnInit(): void {
    this.loadProducteurs();
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
