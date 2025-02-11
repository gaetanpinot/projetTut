import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ConnexionService } from '../../../../Services/connexion.service';
import { LogInRequestBody } from '../../../../Interfaces/connexion-user.interface';
import { Store } from '@ngxs/store';

@Component({
  selector: 'app-connexion',
  standalone: false,

  templateUrl: './connexion.component.html',
  styleUrl: './connexion.component.scss'
})
export class ConnexionComponent implements OnInit {

  connectForm = new FormGroup({
    nom_utilisateur: new FormControl('', [Validators.required]),
    mot_de_passe: new FormControl('', [Validators.required])
  })

  constructor(private connectServ: ConnexionService, private store: Store){
  }


  ngOnInit(): void {

  }


  onSubmit() {
    console.log("ok")
    const body: LogInRequestBody = {
      nom_utilisateur: this.connectForm.value.nom_utilisateur,
      mot_de_passe: this.connectForm.value.mot_de_passe
    };

    console.log(body)

    this.connectServ.logIn(body).subscribe(
      {
        next: (data) => {
          console.log(data);

          localStorage.setItem("token", data.token);
          this.store.dispatch({token: data.token}).subscribe(() => {});

        },
        error: (err) => {
          console.error(err);
        }
      }
    );
  }


}
