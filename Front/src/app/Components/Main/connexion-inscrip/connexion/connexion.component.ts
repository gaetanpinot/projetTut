import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ConnexionService } from '../../../../Services/connexion.service';
import { LogInRequestBody } from '../../../../Interfaces/connexion-user.interface';
import { AuthStoreService } from '../../../../Services/store/AuthStore.service';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';

@Component({
  selector: 'app-connexion',
  standalone: false,
  templateUrl: './connexion.component.html',
  styleUrls: ['./connexion.component.scss']
})
export class ConnexionComponent implements OnInit {

  connectForm = new FormGroup({
    nom_utilisateur: new FormControl('', [Validators.required]),
    mot_de_passe: new FormControl('', [Validators.required])
  });

  loading: boolean = false;
  errorMessage: string | null = null;

  constructor(
    private connectServ: ConnexionService,
    private authStore: AuthStoreService,
    private router: Router // Injection de Router
  ) {}

  ngOnInit(): void {}

  onSubmit() {
    if (this.connectForm.invalid) {
      this.errorMessage = "Veuillez remplir tous les champs.";
      return;
    }

    this.loading = true;
    this.errorMessage = null;

    const body: LogInRequestBody = {
      nom_utilisateur: this.connectForm.value.nom_utilisateur!,
      mot_de_passe: this.connectForm.value.mot_de_passe!
    };

    console.log(body);

    this.connectServ.logIn(body).pipe(
      catchError((err) => {
        console.error("Erreur de connexion :", err);
        this.errorMessage = "Échec de la connexion. Vérifiez vos identifiants.";
        this.loading = false;
        return of(null); // Évite que l'observable crashe
      })
    ).subscribe(data => {
      if (data) {
        this.authStore.setUser(data.token, data.utilisateur.role, data.utilisateur.id);
        this.router.navigate(['/']);
      }
      this.loading = false;
    });
  }
}
