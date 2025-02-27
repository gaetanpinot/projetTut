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

  user = {
    nom: '',
    role: ''
  };

  password = {
    old: '',
    new: '',
    confirm: ''
  };

  isClient: boolean = false;
  isProducteur: boolean = false;

  allergies: Preference[] = [];
  ustensiles: Preference[] = [];

  constructor(private authStore: AuthStoreService, private router: Router) {}

  ngOnInit(): void {
    this.user.nom = this.authStore.getName() || 'Utilisateur';
    this.user.role = this.authStore.getRole() === 1 ? 'Producteur' : 'Client';

    this.isClient = this.authStore.isClient();
    this.isProducteur = this.authStore.isProducteur();

    this.loadPreferences();
  }

  /**
   * Chargement des préférences utilisateur (simulateur, à remplacer par API)
   */
  loadPreferences(): void {
    setTimeout(() => {
      this.allergies = [
        { nom: 'Gluten', checked: true },
        { nom: 'Lactose', checked: false },
        { nom: 'Noix', checked: true },
        { nom: 'Fruits de mer', checked: false },
        { nom: 'Oeufs', checked: false }
      ];

      this.ustensiles = [
        { nom: 'Poêle', checked: false },
        { nom: 'Casserole', checked: true },
        { nom: 'Spatule', checked: false },
        { nom: 'Fouet', checked: false },
        { nom: 'Couteau de chef', checked: true }
      ];

      this.isLoading = false;
    }, 1500);
  }

  toggleForm(): void {
    this.showForm = !this.showForm;
  }

  /**
   * Mise à jour des informations utilisateur
   */
  updateUser(event: Event): void {
    event.preventDefault();

    if (!this.user.nom.trim()) {
      alert('Veuillez renseigner un nom.');
      return;
    }

    console.log('Mise à jour du compte :', this.user);
    alert('Informations mises à jour avec succès !');
  }

  /**
   * Changement de mot de passe
   */
  changePassword(event: Event): void {
    event.preventDefault();

    if (!this.password.old || !this.password.new || !this.password.confirm) {
      alert('Veuillez remplir tous les champs.');
      return;
    }

    if (this.password.new.length < 6) {
      alert('Le mot de passe doit contenir au moins 6 caractères.');
      return;
    }

    if (this.password.new !== this.password.confirm) {
      alert('Les nouveaux mots de passe ne correspondent pas.');
      return;
    }

    console.log('Mot de passe changé.');
    alert('Mot de passe modifié avec succès !');

    this.password = { old: '', new: '', confirm: '' };
  }

  /**
   * Enregistrement des préférences utilisateur
   */
  saveAllergies(): void {
    const selectedAllergies = this.allergies
      .filter((allergy) => allergy.checked)
      .map((allergy) => allergy.nom);

    console.log('Allergies sauvegardées :', selectedAllergies);
    alert('Allergies mises à jour !');
  }

  saveUstensiles(): void {
    const selectedUstensiles = this.ustensiles
      .filter((ustensile) => ustensile.checked)
      .map((ustensile) => ustensile.nom);

    console.log('Ustensiles sauvegardés :', selectedUstensiles);
    alert('Ustensiles mis à jour !');
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
