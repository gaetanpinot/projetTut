import { Component } from '@angular/core';

interface Panier {
  id: number;
  nom: string;
  description: string;
  producteur: string;
  prix: number;
  date: string;
  items: { nom: string; quantite?: number; poids?: number }[];
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
      nom: 'Panier Famille',
      description: 'Un panier varié pour toute la famille.',
      producteur: 'Ferme du Soleil',
      prix: 29.99,
      date: '2024-02-28',
      items: [
        { nom: 'Carottes', quantite: 7 },
        { nom: 'Pommes', quantite: 3 },
        { nom: 'Pommes de terre', poids: 2.5 },
        { nom: 'Oignons', poids: 1 },
        { nom: 'Courgettes', quantite: 4 },
        { nom: 'Yaourt nature', quantite: 6 },
        { nom: 'Œufs', quantite: 12 }
      ]
    },
    {
      id: 2,
      nom: 'Panier Bio',
      description: 'Un panier pour les amateurs de produits bio.',
      producteur: 'Bio Market',
      prix: 35.50,
      date: '2024-03-01',
      items: [
        { nom: 'Tomates', quantite: 5 },
        { nom: 'Salade verte', quantite: 2 },
        { nom: 'Radis', poids: 0.5 },
        { nom: 'Pâtes complètes', poids: 1 },
        { nom: 'Fromage de chèvre', poids: 0.3 },
        { nom: 'Bananes', poids: 1.2 },
        { nom: 'Poivrons', quantite: 3 }
      ]
    },
    {
      id: 3,
      nom: 'Panier Gourmet',
      description: 'Un panier pour les gourmets et cuisiniers passionnés.',
      producteur: 'Ferme des Délices',
      prix: 42.75,
      date: '2024-03-05',
      items: [
        { nom: 'Courgettes', quantite: 4 },
        { nom: 'Champignons', poids: 0.8 },
        { nom: 'Basilic frais', quantite: 1 },
        { nom: 'Filet de saumon', poids: 0.5 },
        { nom: 'Riz basmati', poids: 2 },
        { nom: 'Vin blanc bio', quantite: 1 },
        { nom: 'Chocolat noir 70%', quantite: 2 }
      ]
    },
    {
      id: 4,
      nom: 'Panier Express',
      description: 'Un panier rapide et équilibré pour la semaine.',
      producteur: 'Local Market',
      prix: 25.90,
      date: '2024-03-10',
      items: [
        { nom: 'Pâtes fraîches', poids: 1 },
        { nom: 'Sauce tomate maison', quantite: 1 },
        { nom: 'Mozzarella', poids: 0.25 },
        { nom: 'Poulet fermier', poids: 1.2 },
        { nom: 'Haricots verts', poids: 0.7 },
        { nom: 'Baguette de pain', quantite: 1 },
        { nom: 'Compote de pommes', quantite: 4 }
      ]
    },
    {
      id: 5,
      nom: 'Panier Végétarien',
      description: 'Un panier riche en légumes et protéines végétales.',
      producteur: 'Green Farm',
      prix: 38.50,
      date: '2024-03-15',
      items: [
        { nom: 'Lentilles corail', poids: 1 },
        { nom: 'Tofu nature', poids: 0.5 },
        { nom: 'Avocats', quantite: 2 },
        { nom: 'Blettes', poids: 0.6 },
        { nom: 'Noix de cajou', poids: 0.3 },
        { nom: 'Patates douces', poids: 1.5 },
        { nom: 'Miel bio', quantite: 1 }
      ]
    }
  ];

  showDeletePopup: boolean = false;
  panierToDeleteId: number | null = null;

  /**
   * Ouvre le popup de confirmation et stocke l'ID du panier à supprimer
   */
  openDeletePopup(panierId: number): void {
    this.panierToDeleteId = panierId;
    this.showDeletePopup = true;
  }

  /**
   * Ferme le popup de confirmation sans supprimer le panier
   */
  closeDeletePopup(): void {
    this.showDeletePopup = false;
    this.panierToDeleteId = null;
  }

  /**
   * Supprime définitivement le panier sélectionné
   */
  deletePanier(): void {
    if (this.panierToDeleteId !== null) {
      this.paniers = this.paniers.filter(panier => panier.id !== this.panierToDeleteId);
      this.closeDeletePopup();
    }
  }
}
