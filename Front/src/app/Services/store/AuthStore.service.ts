import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthStoreService {
  private tokenUser = new BehaviorSubject<string | null>(this.getTokenObservable());

  public token$ = this.tokenUser.asObservable();

  public getToken(): string | null {
    return this.tokenUser.value;
  }

  public setToken(token: string): void {
    localStorage.setItem('user_token', token);
    this.tokenUser.next(token);
  }

  public clearToken(): void {
    localStorage.removeItem('user_token');
    this.tokenUser.next(null);
  }

  private getTokenObservable(): string | null {
    return localStorage.getItem('user_token');
  }
}
