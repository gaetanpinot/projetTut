import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthStoreService {
  private tokenUser = new BehaviorSubject<string | null>(this.getTokenObservable());
  private roleUser = new BehaviorSubject<number | null>(this.getRoleObservable());
  private idUser = new BehaviorSubject<string | null>(this.getIdObservable());
  private idName = new BehaviorSubject<string | null>(this.getNameObservable());
  public token$ = this.tokenUser.asObservable();
  public role$ = this.roleUser.asObservable();
  public name$ = this.idName.asObservable();

  public setUser(token: string, role: number, id: string): void {
    localStorage.setItem('user_token', token);
    localStorage.setItem('user_role', role.toString());
    localStorage.setItem('user_id', id);
    this.tokenUser.next(token);
    this.roleUser.next(role);
    this.idUser.next(id);
  }

  public getRole(): number | null {
    return this.roleUser.value;
  }

  public getId(): string | null {
    return this.idUser.value;
  }

  public getName(): string | null {
    return this.idName.value;
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
    localStorage.removeItem('user_id');
    localStorage.removeItem('user_name');
    this.tokenUser.next(null);
    this.roleUser.next(null);
    this.idUser.next(null);
    this.idName.next(null);
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

  private getIdObservable(): string | null {
    const id = localStorage.getItem('user_id');
    return id !== null ? id : null;
  }

  private getNameObservable(): string | null {
    const name = localStorage.getItem('user_name');
    return name !== null ? name : null;
  }
}
