import {StoreModel} from './store.model';
import {Action, Selector, State, StateContext} from '@ngxs/store';
import {SetTokenUser} from './store.actions';

@State<StoreModel>({
  name: "user",
  defaults: {
    token: ""
  }
})

export class StoreUser {
  @Selector()
  static getToken(state: StoreModel): string {
    return state.token;
  }

  @Action(SetTokenUser)
  static SetTokenUser(ctx: StateContext<StoreModel>, action: SetTokenUser): void {
    ctx.patchState({
      token: action.token
    })
  }
}
