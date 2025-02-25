import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { apiBaseUrl } from '../../environment';
import { Ingredient, IngredientProduit } from '../Interfaces/ingredient.interface';
import { Observable } from 'rxjs';
import { AuthStoreService } from './store/AuthStore.service';

@Injectable({
  providedIn: 'root'
})
export class IngredientsServicesService {

  private apiServerUrl = apiBaseUrl;
  constructor(private http: HttpClient, private authStore: AuthStoreService) { }

  getIngredients(): Observable<Ingredient[]> {
    return this.http.get<Ingredient[]>(this.apiServerUrl + '/ingredients');
  }

  getIngredientsProduit(id: string): Observable<IngredientProduit> {
    return this.http.get<IngredientProduit>(this.apiServerUrl + '/producteurs/' + id + '/ingredients', {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

}
