import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthStoreService {
  private tokenUser = new BehaviorSubject<string | null>(this.getTokenObservable());
  private roleUser = new BehaviorSubject<number | null>(this.getRoleObservable());

  public token$ = this.tokenUser.asObservable();
  public role$ = this.roleUser.asObservable();

  public setUser(token: string, role: number): void {
    localStorage.setItem('user_token', token);
    localStorage.setItem('user_role', role.toString());
    this.tokenUser.next(token);
    this.roleUser.next(role);
  }

  public getRole(): number | null {
    return this.roleUser.value;
  }

  public isProducteur(): boolean {
    return Number(this.roleUser.value) === 1;
  }

  public getToken(): string | null {
    return this.tokenUser.value;
  }

  public clearUser(): void {
    localStorage.removeItem('user_token');
    localStorage.removeItem('user_role');
    this.tokenUser.next(null);
    this.roleUser.next(null);
  }

  public isAuthenticated(): boolean {
    return this.tokenUser.value !== null;
  }

  public isClient(): boolean {
    return Number(this.roleUser.value) === 0;
  }

  private getTokenObservable(): string | null {
    return localStorage.getItem('user_token');
  }

  private getRoleObservable(): number | null {
    const role = localStorage.getItem('user_role');
    return role !== null ? Number(role) : null;
  }
}
