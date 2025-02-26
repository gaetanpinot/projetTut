import { Component } from '@angular/core';

interface Panier {
  id: number;
  nom: string;
  description: string;
  items: { nom: string; quantite: number }[];
}

@Component({
  selector: 'app-panier',
  standalone: false,
  templateUrl: './panier.component.html',
  styleUrls: ['./panier.component.scss']
})
export class PanierComponent {
  paniers: Panier[] = [
    {
      id: 1,
      nom: 'Panier 1',
      description: 'Un panier pour toute la famille.',
      items: [
        { nom: 'Carotte', quantite: 7 },
        { nom: 'Pommes', quantite: 3 }
      ]
    },
    {
      id: 2,
      nom: 'Panier 2',
      description: 'Un panier pour les amateurs de bio.',
      items: [
        { nom: 'Tomates', quantite: 5 },
        { nom: 'Salade', quantite: 2 }
      ]
    }
  ];

  supprimerPanier(panierId: number) {
    if (confirm('Êtes-vous sûr de vouloir supprimer ce panier ?')) {
      this.paniers = this.paniers.filter(panier => panier.id !== panierId);
    }
  }
}
