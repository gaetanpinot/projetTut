import { Component } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { DialogComponent } from './dialog/dialog.component';

@Component({
  selector: 'app-home',
  standalone: false,
  
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent {
  constructor(private dialog: MatDialog, private router: Router) {}

  openDialog() {
    this.dialog.open(DialogComponent); 
  }

  goToNextPage() {
    this.router.navigate(['/next']);
  }
}
