import { Component } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { DialogComponent } from './dialog/dialog.component';

@Component({
  selector: 'app-test-home',
  standalone: false,
  
  templateUrl: './test-home.component.html',
  styleUrl: './test-home.component.scss'
})



export class TestHomeComponent {

  
  constructor(private dialog: MatDialog, private router: Router) {}

  openDialog() {
    this.dialog.open(DialogComponent); 
  }

  goToNextPage() {
    this.router.navigate(['/next']);
  }
}
