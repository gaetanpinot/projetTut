import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthStoreService } from '../../../Services/store/AuthStore.service';
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

  constructor(private authStore: AuthStoreService, private router: Router) {}

  // Données utilisateur
  user = {
    nom: "Jean Dupont",
    email: "jean.dupont@example.com",
    role: "Administrateur"
  };

  // Variables pour le changement de mot de passe
  password = {
    old: '',
    new: '',
    confirm: ''
  };

  // Détection du type d'utilisateur (remplace par un service d'authentification si nécessaire)
  isClient: boolean = true;
  isProducteur: boolean = false;

  // Initialisation des préférences
  allergies: Preference[] = [];
  ustensiles: Preference[] = [];

  ngOnInit(): void {
    this.loadPreferences();
  }

  /**
   * Simule le chargement des préférences utilisateur (remplace `setTimeout` par une API en prod)
   */
  loadPreferences(): void {
    try {
      setTimeout(() => {
        this.allergies = [
          { nom: "Gluten", checked: true },
          { nom: "Lactose", checked: false },
          { nom: "Noix", checked: true },
          { nom: "Fruits de mer", checked: false },
          { nom: "Oeufs", checked: false },
          { nom: "Soja", checked: false },
          { nom: "Arachides", checked: true },
          { nom: "Sésame", checked: false },
          { nom: "Moutarde", checked: false }
        ];

        this.ustensiles = [
          { nom: "Poêle", checked: false },
          { nom: "Casserole", checked: true },
          { nom: "Spatule", checked: false },
          { nom: "Fouet", checked: false },
          { nom: "Couteau de chef", checked: true },
          { nom: "Couteau d'office", checked: false },
          { nom: "Couteau à pain", checked: false },
          { nom: "Four", checked: false },
          { nom: "Micro-ondes", checked: true },
          { nom: "Mixeur", checked: false },
          { nom: "Balance", checked: false }
        ];

        this.isLoading = false; // Fin du chargement
      }, 1500);
    } catch (error) {
      console.error("Erreur lors du chargement des préférences :", error);
    }
  }

  /**
   * Affiche ou masque le formulaire de modification des informations
   */
  toggleForm(): void {
    this.showForm = !this.showForm;
  }

  /**
   * Enregistre les modifications de l'utilisateur (nom/email)
   */
  updateUser(event: Event): void {
    event.preventDefault(); // Empêche le rechargement de la page

    if (!this.user.nom.trim() || !this.user.email.trim()) {
      alert("Veuillez remplir tous les champs avant d'enregistrer !");
      return;
    }


  }

  /**
   * Change le mot de passe de l'utilisateur après validation
   */
  changePassword(event: Event): void {
    event.preventDefault(); // Empêche le rechargement de la page

    if (!this.password.old.trim() || !this.password.new.trim() || !this.password.confirm.trim()) {
      alert("Veuillez remplir tous les champs !");
      return;
    }

    if (this.password.new.length < 6) {
      alert("Le mot de passe doit contenir au moins 6 caractères !");
      return;
    }

    if (this.password.new !== this.password.confirm) {
      alert("Les nouveaux mots de passe ne correspondent pas !");
      return;
    }

    this.password = { old: '', new: '', confirm: '' };
  }

  /**
   * Valide et sauvegarde les allergies sélectionnées
   */
  saveAllergies(): void {
    const selectedAllergies = this.allergies.filter(allergy => allergy.checked).map(allergy => allergy.nom);

  }

  /**
   * Valide et sauvegarde les ustensiles sélectionnés
   */
  saveUstensiles(): void {
    const selectedUstensiles = this.ustensiles.filter(ustensile => ustensile.checked).map(ustensile => ustensile.nom);

  }

  /**
   * Ouvre le popup de confirmation de déconnexion
   */
  openLogoutPopup(): void {
    this.showLogoutPopup = true;
  }

  /**
   * Ferme le popup de confirmation de déconnexion
   */
  closeLogoutPopup(): void {
    this.showLogoutPopup = false;
  }

  /**
   * Déconnecte l'utilisateur après confirmation
   */
  logout(): void {
    this.showLogoutPopup = false;
    this.authStore.clearUser(); // Suppression des données utilisateur
    this.router.navigate(['/Home']); // Redirection via Angular Router
  }
}
