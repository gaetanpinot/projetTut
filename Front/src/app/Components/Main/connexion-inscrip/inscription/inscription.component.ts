import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { matchFieldsValidator } from '../../../../shared/validators/matchFieldsValidator';
import { SignInRequestBody } from '../../../../Interfaces/connexion-user.interface';
import { ConnexionService } from '../../../../Services/connexion.service';
import { Router } from '@angular/router';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';

@Component({
  selector: 'app-inscription',
  standalone: false,
  templateUrl: './inscription.component.html',
  styleUrls: ['./inscription.component.scss']
})
export class InscriptionComponent {
  inscripForm = new FormGroup({
    nom_utilisateur: new FormControl('', [Validators.required]),
    mot_de_passe: new FormControl('', [Validators.required]),
    mot_de_passe_confirm: new FormControl('', [Validators.required]),
    role: new FormControl(0, [Validators.required])
  }, { validators: matchFieldsValidator('mot_de_passe', 'mot_de_passe_confirm') });


  loading: boolean = false;
  errorMessage: string | null = null;

  constructor(private connectServ: ConnexionService, private router: Router) {}

  onSubmit() {
    if (this.inscripForm.invalid) {
      this.errorMessage = "Veuillez remplir tous les champs.";
      return;
    }

    this.loading = true;
    this.errorMessage = null;

    const body: SignInRequestBody = {
      nom_utilisateur: this.inscripForm.value.nom_utilisateur ?? '',
      mot_de_passe: this.inscripForm.value.mot_de_passe ?? '',
      role: Number(this.inscripForm.value.role),
    };

    this.connectServ.signIn(body).pipe(
      catchError(err => {
        this.errorMessage = "Échec de l'inscription. Veuillez réessayer.";
        this.loading = false;
        return of(null);
      })
    ).subscribe(data => {
      if (data) {
        console.log(data);
        localStorage.setItem("token", data.token);
        this.router.navigate(['/connexion']);
      }
      this.loading = false;
    });
  }
}
