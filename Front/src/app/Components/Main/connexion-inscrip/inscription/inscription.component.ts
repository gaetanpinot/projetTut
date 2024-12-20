import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { matchFieldsValidator } from '../../../../shared/validators/matchFieldsValidator';
import { LogInRequestBody, SignInRequestBody } from '../../../../Interfaces/connexion-user.interface';
import { ConnexionService } from '../../../../Services/connexion.service';

@Component({
  selector: 'app-inscription',
  standalone: false,
  
  templateUrl: './inscription.component.html',
  styleUrl: './inscription.component.scss'
})
export class InscriptionComponent {
  inscripForm = new FormGroup({
      nom_utilisateur: new FormControl('', [Validators.required]),
      mot_de_passe: new FormControl('', [Validators.required]),
      mot_de_passe_confirm: new FormControl('', [Validators.required])
    },
    { validators: matchFieldsValidator('mot_de_passe', 'mot_de_passe_confirm') }
  )

  constructor(private connectServ: ConnexionService){
  }
  

  onSubmit() {
    console.log("ok")
    const body: SignInRequestBody = {
      nom_utilisateur: this.inscripForm.value.nom_utilisateur,
      mot_de_passe: this.inscripForm.value.mot_de_passe,
      role: 0
    };

    console.log(body)
    
    this.connectServ.signIn(body).subscribe(
      {
        next: (data) => {
          console.log(data);
        },
        error: (err) => {
          console.error(err);
        }
      }
    );
  }

}
