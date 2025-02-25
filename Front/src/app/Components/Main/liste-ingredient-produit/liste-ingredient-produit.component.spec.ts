import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListeIngredientProduitComponent } from './liste-ingredient-produit.component';

describe('ListeIngredientProduitComponent', () => {
  let component: ListeIngredientProduitComponent;
  let fixture: ComponentFixture<ListeIngredientProduitComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ListeIngredientProduitComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListeIngredientProduitComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
