import { Injectable } from '@angular/core';
import { apiBaseUrl } from '../../environment';
import { HttpClient } from '@angular/common/http';
import { PanierInput, PanierResponse, PaniersResponse } from '../Interfaces/panier.interface';
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

  getPaniers(): Observable<PaniersResponse> {
    return this.http.get<PaniersResponse>(this.apiServerUrl + '/paniers', {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }

  publierPanier(id: number): any {
    return this.http.post(this.apiServerUrl + '/paniers/' + id, {},
      {
        headers: {
          'Authorization': 'Bearer ' + this.authStore.getToken()
        },
        observe: 'response'
      }
    )
  }
}
