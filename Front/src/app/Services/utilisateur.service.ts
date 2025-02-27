import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AuthStoreService } from './store/AuthStore.service';
import { apiBaseUrl } from '../../environment';
import { Allergie, Producteur, Profile } from '../Interfaces/utilisateur.interface';
import { Observable } from 'rxjs';
import { FrigoInput, IngredientFrigo } from '../Interfaces/ingredient.interface';

@Injectable({
  providedIn: 'root'
})
export class UtilisateurService {

  private apiServerUrl = apiBaseUrl;
  constructor(private http: HttpClient, private authStore: AuthStoreService) { }

  getProducteurs(): Observable<Producteur[]> {
    return this.http.get<Producteur[]>(this.apiServerUrl + '/producteurs');
  }

  public abonnerProducteur(id: string): Observable<any> {
    return this.http.post<any>(this.apiServerUrl + '/utilisateurs/producteurs/' + id, {}, {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }
  public getFrigo(): Observable<IngredientFrigo[]> {
    return this.http.get<IngredientFrigo[]>(this.apiServerUrl + '/utilisateurs/frigo', {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }
  public remplacerFrigo(ingredients: FrigoInput): Observable<IngredientFrigo[]> {
    return this.http.put<IngredientFrigo[]>(this.apiServerUrl + '/utilisateurs/frigo', ingredients, {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

  public getProfile(): Observable<Profile> {
    return this.http.get<Profile>(this.apiServerUrl + '/utilisateurs', {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

  public addAllergene(id: number): Observable<any> {
    return this.http.post<any>(this.apiServerUrl + '/utilisateurs/allergenes', {
      "id_allergene": Number(id)
    }, {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

  public deleteAllergene(id: number): Observable<any> {
    return this.http.delete<any>(this.apiServerUrl + '/utilisateurs/allergenes/' + id, {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

  public getAllergenes(): Observable<Allergie[]> {
    return this.http.get<Allergie[]>(this.apiServerUrl + '/allergenes', {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

  public addIngredient(id: number): Observable<any> {
    return this.http.post<any>(this.apiServerUrl + '/utilisateurs/ingredients_exclus', {
      "id_ingredient": Number(id)
    }, {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

  public deleteIngredient(id: number): Observable<any> {
    return this.http.delete<any>(this.apiServerUrl + '/utilisateurs/ingredients_exclus/' + id, {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

  public getProducteursUtilisateurConnectee(): Observable<Producteur[]> {
    return this.http.get<Producteur[]>(this.apiServerUrl + '/utilisateurs/producteurs', {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

}
