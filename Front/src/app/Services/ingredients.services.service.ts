import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { apiBaseUrl } from '../../environment';
import { Ingredient } from '../Interfaces/ingredient.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class IngredientsServicesService {

  private apiServerUrl = apiBaseUrl;
  constructor(private http: HttpClient) { }

  getIngredients(): Observable<Ingredient[]> {
    return this.http.get<Ingredient[]>(this.apiServerUrl + '/ingredients');
  }

}
