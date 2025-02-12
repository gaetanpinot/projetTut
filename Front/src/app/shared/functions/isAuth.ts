export function isAuth(): boolean{
    return localStorage['token'] != null;
}
export function isClient(): boolean{
    return localStorage['role'] === 'client';
}
