import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ConnexionService } from '../../../../Services/connexion.service';
import { LogInRequestBody } from '../../../../Interfaces/connexion-user.interface';
import { AuthStoreService } from '../../../../Services/store/AuthStore.service';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { MatSnackBar } from '@angular/material/snack-bar';

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
    private router: Router,
    private snackbar: MatSnackBar,
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
        this.snackbar.open(err.error.message, 'x', {
          duration: 5000,
        });
        this.loading = false;
        return of(null); // Évite que l'observable crashe
      })
    ).subscribe(data => {
      if (data) {
        this.authStore.setUser(data.token, data.utilisateur.role, data.utilisateur.id);
        this.router.navigate(['/Home']);
      }
      this.loading = false;
    });
  }
}
