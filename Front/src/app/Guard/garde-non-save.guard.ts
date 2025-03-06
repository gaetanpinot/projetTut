import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanDeactivate, CanDeactivateFn, GuardResult, MaybeAsync, RouterStateSnapshot } from '@angular/router';
import { FrigoComponent } from '../Components/Main/frigo/frigo.component';
@Injectable()
export class GardeNonSaveGuard implements CanDeactivate<FrigoComponent> {
  constructor() { }
  async canDeactivate(component: FrigoComponent,
    currentRoute: ActivatedRouteSnapshot,
    currentState: RouterStateSnapshot,
    nextState: RouterStateSnapshot): Promise<GuardResult> {
    if (!component.isPanierModifiee) {
      return true;
    }
    return await component.dialogFrigoNonSauvegardee();
  }
}
