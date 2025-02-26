import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AuthStoreService } from './store/AuthStore.service';
import { apiBaseUrl } from '../../environment';
import { Producteur } from '../Interfaces/utilisateur.interface';
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

}
