import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthStoreService } from '../../../Services/store/AuthStore.service';
import { UtilisateurService } from '../../../Services/utilisateur.service';
import { Allergie, Producteur } from '../../../Interfaces/utilisateur.interface';
import { Ingredient } from '../../../Interfaces/ingredient.interface';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { MatSnackBar } from '@angular/material/snack-bar';

interface Preference {
  nom: string;
  checked: boolean;
}

@Component({
  selector: 'app-account',
  standalone: false,
  templateUrl: './account.component.html',
  styleUrls: ['./account.component.scss']
})
export class AccountComponent implements OnInit {
  showForm: boolean = false;
  isLoading: boolean = true; // État de chargement des préférences
  showLogoutPopup: boolean = false; // État du popup de déconnexion

  constructor(private ingredientsService: IngredientsServicesService,
    public authStore: AuthStoreService,
    private router: Router,
    private utilisateurService: UtilisateurService,
    private snackbar: MatSnackBar,
  ) { }

  // Données utilisateur
  user = {
    nom: '',
  };


  // Détection du type d'utilisateur (remplace par un service d'authentification si nécessaire)
  isClient: boolean = true;
  isProducteur: boolean = false;

  // Initialisation des préférences
  allergies: Allergie[] = [];
  ustensiles: Preference[] = [];
  ingre_exclus: Ingredient[] = [];
  ingredients: Ingredient[] = [];

  async ngOnInit(): Promise<void> {
    await this.loadIngredients();
    await this.loadAllergenes();
    await this.loadPreferences();
    this.loadProducteursUtilisateurConnectee()

  }

  addAllergie(id: number): void {
    this.utilisateurService.addAllergene(id).subscribe({
      next: () => {

      }
    });
  }

  deleteAllergie(id: number): void {
    this.utilisateurService.deleteAllergene(id).subscribe({
      next: () => {

      }
    });
  }

  changeAllergie(allergie: Allergie): void {
    if (allergie.check) {
      this.addAllergie(allergie.id);
    }
    else {
      this.deleteAllergie(allergie.id);
    }
  }

  addIngredient(id: number): void {
    this.utilisateurService.addIngredient(id).subscribe({
      next: () => {

      }
    });
  }

  deleteIngredient(id: number): void {
    this.utilisateurService.deleteIngredient(id).subscribe({
      next: () => {

      }
    });
  }

  changeIngredient(ingre: Ingredient): void {
    if (ingre.check) {
      this.addIngredient(ingre.id);
    }
    else {
      this.deleteIngredient(ingre.id);
    }
  }
  public producteursUtilisateur: Producteur[] = [];
  loadProducteursUtilisateurConnectee(): void {
    if (!this.authStore.isAuthenticated()) return;
    this.utilisateurService.getProducteursUtilisateurConnectee().subscribe({
      next: (data) => {
        this.producteursUtilisateur = data.producteurs;
      },
      error: (err) => {
        console.error(err);
      }
    });
  }

  desabonneProducteur(id: string): void {
    this.utilisateurService.desabonneProducteur(id).subscribe({
      next: () => {
        this.loadProducteursUtilisateurConnectee();
      },
      error: (err) => {
        console.error(err);
      }
    });
  }


  async loadPreferences(): Promise<void> {
    try {
      this.utilisateurService.getProfile().subscribe({
        next: async (data) => {

          this.user.nom = data.utilisateur.nom_utilisateur;
          this.ingre_exclus = data.ingredients_exclus;

          for (let i = 0; i < this.allergies.length; i++) {
            for (let j = 0; j < data.allergies.length; j++) {
              if (data.allergies[j].id === this.allergies[i].id) {
                this.allergies[i].check = true;
              }
            }
          }

          for (let i = 0; i < this.ingredients.length; i++) {
            for (let j = 0; j < data.ingredients_exclus.length; j++) {
              if (data.ingredients_exclus[j].id === this.ingredients[i].id) {
                this.ingredients[i].check = true;
              }
            }
          }
        },
        error: (err) => {
          this.snackbar.open("Erreur lors du chargement des préférences,\
            Veuillez vous reconnecter", "Fermer", {
            duration: 10000
          });
          console.error(err);
        }
      })

      this.isLoading = false;
    } catch (error) {
      console.error("Erreur lors du chargement des préférences :", error);
    }
  }

  async loadAllergenes(): Promise<void> {
    this.utilisateurService.getAllergenes().subscribe({
      next: (data) => {
        this.allergies = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }

  async loadIngredients() {
    this.ingredientsService.getIngredients().subscribe({
      next: (data) => {
        this.ingredients = data;
      },
      error: (err) => {
        console.error(err);
      }
    })
  }



  /**
   * Popup de confirmation de déconnexion
   */
  openLogoutPopup(): void {
    this.showLogoutPopup = true;
  }

  closeLogoutPopup(): void {
    this.showLogoutPopup = false;
  }

  logout(): void {
    this.authStore.clearUser();
    this.router.navigate(['/Home']);
  }
}
