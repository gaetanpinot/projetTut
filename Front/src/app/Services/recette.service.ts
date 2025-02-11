import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { apiBaseUrl } from '../../environment';
import { GetRecetteResponse } from '../Interfaces/recette.interface';

@Injectable({
  providedIn: 'root'
})
export class RecetteService {

  private apiServerUrl = apiBaseUrl;
  constructor(private http: HttpClient) { }

  getRecettes(page: number): Observable<GetRecetteResponse[]>{
    return this.http.get<GetRecetteResponse[]>(this.apiServerUrl + '/recettes?page=' + page);
  }
}
