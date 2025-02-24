import { Injectable } from '@angular/core';
import { apiBaseUrl } from '../../environment';
import { HttpClient } from '@angular/common/http';
import { PanierInput, PanierResponse } from '../Interfaces/panier.interface';
import { Observable } from 'rxjs';
import { AuthStoreService } from './store/AuthStore.service';

@Injectable({
  providedIn: 'root'
})
export class PanierService {
  private apiServerUrl = apiBaseUrl;
  constructor(private http: HttpClient, private authStore: AuthStoreService) {
  }
  createPanier(body: PanierInput): Observable<PanierResponse> {
    return this.http.post<PanierResponse>(this.apiServerUrl + '/paniers', body, {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }
}
