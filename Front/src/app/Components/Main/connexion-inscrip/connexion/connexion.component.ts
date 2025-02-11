import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ConnexionService } from '../../../../Services/connexion.service';
import { LogInRequestBody } from '../../../../Interfaces/connexion-user.interface';
<<<<<<< HEAD
import { AuthStoreService } from '../../../../Services/store/AuthStore.service';
=======
import { Store } from '@ngxs/store';
>>>>>>> e6e7a859d056183fba2b9de051b4f6b8f474a9b1

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

<<<<<<< HEAD
  constructor(private connectServ: ConnexionService, private authStore: AuthStoreService){
=======
  constructor(private connectServ: ConnexionService, private store: Store){
>>>>>>> e6e7a859d056183fba2b9de051b4f6b8f474a9b1
  }

  ngOnInit(): void {

  }
<<<<<<< HEAD
  
=======


>>>>>>> e6e7a859d056183fba2b9de051b4f6b8f474a9b1
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

<<<<<<< HEAD
          this.authStore.setToken(data.token);
          console.log(this.authStore);
          
          //token
          console.log(this.authStore.getToken());
=======
          localStorage.setItem("token", data.token);
          this.store.dispatch({token: data.token}).subscribe(() => {});

>>>>>>> e6e7a859d056183fba2b9de051b4f6b8f474a9b1
        },
        error: (err) => {
          console.error(err);
        }
      }
    );
  }


}
