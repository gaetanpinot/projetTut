import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { apiBaseUrl } from '../../environment';
import { GetIngredientsResponse, GetRecetteResponse, Recette, RecetteInput } from '../Interfaces/recette.interface';
import { AuthStoreService } from './store/AuthStore.service';

@Injectable({
  providedIn: 'root'
})
export class RecetteService {

  private apiServerUrl = apiBaseUrl;
  constructor(private http: HttpClient,
    private authStore: AuthStoreService) { }

  getRecettes(page: number,
    selected: number[],
    banned: number[],
    startSaison: number,
    endSaison: number,
    allergenes: number[],
  ): Observable<GetRecetteResponse[]> {
    let selectedSearch = "";
    if (selected.length > 0)
      selectedSearch = "&id_ingredients_principaux=[" + selected.join(",") + "]";

    let bannedSearch = "";
    if (banned.length > 0)
      bannedSearch = "&id_ingredients_exclus=[" + banned.join(",") + "]";

    let allergenesSearch = "";
    if (allergenes.length > 0)
      allergenesSearch = "&id_allergenes=[" + allergenes.join(",") + "]";

    return this.http.get<GetRecetteResponse[]>(this.apiServerUrl +
      '/recettes?page=' +
      page +
      selectedSearch +
      bannedSearch +
      allergenesSearch +
      "&debut_saison=" +
      startSaison +
      "&fin_saison=" +
      endSaison);
  }

  getIngredients(): Observable<GetIngredientsResponse[]> {
    return this.http.get<GetIngredientsResponse[]>(this.apiServerUrl + '/ingredients');
  }

  getRecettesByName(name: string): Observable<GetRecetteResponse[]> {
    return this.http.get<GetRecetteResponse[]>(this.apiServerUrl + '/recettes?nom=' + name);
  }

  getRecetteById(id: number) {
    return this.http.get<Recette>(this.apiServerUrl + '/recettes/' + id);
  }

  getRandomRecettes() {
    return this.http.get<Recette[]>(this.apiServerUrl + '/recettes/random');
  }

  createRecette(recette: RecetteInput) {
    return this.http.post(this.apiServerUrl + '/recettes', recette,
      {
        headers: {
          'Authorization': 'Bearer ' + this.authStore.getToken(),
        },
      }
    );
  }
}
