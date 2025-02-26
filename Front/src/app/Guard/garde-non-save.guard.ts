import { CanDeactivateFn } from '@angular/router';

export const gardeNonSaveGuard: CanDeactivateFn<unknown> = (component, currentRoute, currentState, nextState) => {
  console.log(component)
  return true;
};
