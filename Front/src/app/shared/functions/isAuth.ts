export function isAuth(): boolean{
    return localStorage['token'] != null;
}