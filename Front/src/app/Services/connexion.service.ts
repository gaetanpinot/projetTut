import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { apiBaseUrl } from '../../environment';
import { TestUserInterface } from '../Interfaces/test-user.interface';
import { LogInRequestBody, LogSignInResponse, SignInRequestBody } from '../Interfaces/connexion-user.interface';

@Injectable({
  providedIn: 'root'
})
export class ConnexionService {

  private apiServerUrl = apiBaseUrl;
  constructor(private http: HttpClient) { }
  
  signIn(body: SignInRequestBody): Observable<LogSignInResponse>{
    return this.http.post<LogSignInResponse>(this.apiServerUrl + '/inscription', body);
  }

  logIn(body: LogInRequestBody): Observable<LogSignInResponse>{
    return this.http.post<LogSignInResponse>(this.apiServerUrl + '/connexion', body);
  }
}
