import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { TestService } from '../../../../Services/test.service';
import { TestUserInterface } from '../../../../Interfaces/test-user.interface';

@Component({
  selector: 'app-dialog',
  standalone: false,
  templateUrl: './dialog.component.html',
  styleUrl: './dialog.component.scss'
})
export class DialogComponent implements OnInit {
  users: TestUserInterface[] = [];

  constructor(private dialogRef: MatDialogRef<DialogComponent>,
    private testService: TestService
  ) {}

  ngOnInit(): void {
    this.loadUserData();
  }

  loadUserData(): void {
    this.testService.getUsers().subscribe({
      next: (users) => {
        this.users = users;
      },
      error: (err) => {
        console.error(err);
      }
    });
  }

  closeDialog() {
    this.dialogRef.close(); 
  }
}
