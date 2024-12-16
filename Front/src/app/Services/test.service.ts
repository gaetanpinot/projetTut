import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { apiUrl } from '../../environment';
import { Observable } from 'rxjs';
import { TestUserInterface } from '../Interfaces/test-user.interface';

@Injectable({
  providedIn: 'root'
})
export class TestService {

  private apiServerUrl = apiUrl;
  constructor(private http: HttpClient) { }

  getUsers(): Observable<TestUserInterface[]> {
    return this.http.get<TestUserInterface[]>(this.apiServerUrl);
  }
}
