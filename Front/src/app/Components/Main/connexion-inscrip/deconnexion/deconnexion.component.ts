import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-deconnexion',
  standalone: false,
  
  templateUrl: './deconnexion.component.html',
  styleUrl: './deconnexion.component.scss'
})
export class DeconnexionComponent implements OnInit{


  ngOnInit(): void {
    localStorage.removeItem('token');
  }

}
