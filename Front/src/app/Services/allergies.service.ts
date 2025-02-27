import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AuthStoreService } from './store/AuthStore.service';
import { apiBaseUrl } from '../../environment';
import { Allergie } from '../Interfaces/allergies.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AllergiesService {

  private apiServerUrl = apiBaseUrl;
  constructor(private http: HttpClient,
    private authStore: AuthStoreService,
  ) { }

  public getAllergies(): Observable<Allergie[]> {
    return this.http.get<Allergie[]>(this.apiServerUrl + '/allergenes', {
      headers: {
        'Authorization': 'Bearer ' + this.authStore.getToken()
      }
    });
  }
}
