import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { IngredientsServicesService } from '../../../Services/ingredients.services.service';
import { Ingredient } from '../../../Interfaces/ingredient.interface';

@Component({
  selector: 'app-frigo',
  standalone: false,
  templateUrl: './frigo.component.html',
  styleUrls: ['./frigo.component.scss']
})
export class FrigoComponent implements OnInit {
  ingredients: Ingredient[] = [];
  filteredIngredients: Ingredient[] = [];
  selectedIngredient: string | null = null;
  frigoForm: FormGroup;
  newItemQuantite: number | null = null;
  newItemPoids: number | null = null;
  fakeMode: boolean = true; // Active ou désactive le mode fake
  fakeFrigo: any[] = [];

  popupVisible: boolean = false;
  popupType: 'clear' | 'delete' | null = null;
  itemToDeleteIndex: number | null = null;

  constructor(private ingredientService: IngredientsServicesService, private fb: FormBuilder) {
    this.frigoForm = this.fb.group({
      ingredients: this.fb.array([])
    });
  }

  get ingredientsFormArray(): FormArray {
    return this.frigoForm.get('ingredients') as FormArray;
  }

  get ingredientsFormArrayControls() {
    return this.ingredientsFormArray.controls as FormGroup[];
  }

  ngOnInit(): void {
    if (this.fakeMode) {
      this.generateFakeFrigo();
    } else {
      this.loadIngredients();
    }
  }

  toggleFakeMode(): void {
    this.fakeMode = !this.fakeMode;
    this.ingredientsFormArray.clear();

    if (this.fakeMode) {
      this.generateFakeFrigo();
    } else {
      this.loadIngredients();
    }
  }

generateFakeFrigo(): void {
    this.fakeFrigo = [
      { nom: 'Fromage', quantite: null, poids: 500 },
      { nom: 'Oeufs', quantite: 6, poids: null },
      { nom: 'Carottes', quantite: 5, poids: null },
      { nom: 'Lait', quantite: null, poids: 1000 },
      { nom: 'Poulet', quantite: null, poids: 800 },
      { nom: 'Pommes', quantite: 4, poids: null },
      { nom: 'Pain', quantite: null, poids: 400 },
      { nom: 'Poivrons', quantite: 3, poids: null },
      { nom: 'Tomates', quantite: 6, poids: null },
      { nom: 'Pâtes', quantite: null, poids: 500 },
      { nom: 'Riz', quantite: null, poids: 600 },
      { nom: 'Jambon', quantite: 2, poids: null },
      { nom: 'Yaourt', quantite: 4, poids: null },
      { nom: 'Beurre', quantite: null, poids: 250 },
      { nom: 'Chocolat', quantite: null, poids: 200 },
    ];

    this.fakeFrigo.forEach(item => {
      this.ingredientsFormArray.push(this.fb.group({
        quantite: [item.quantite ?? null, [Validators.min(1)]],
        poids: [item.poids ?? null, [Validators.min(1)]],
        nom: [item.nom, Validators.required]
      }));
    });
  }

  loadIngredients(): void {
    this.ingredientService.getIngredients().subscribe({
      next: (data) => {
        this.ingredients = data;
        this.filteredIngredients = data;
      },
      error: (err) => {
        console.error('Erreur lors du chargement des ingrédients', err);
      }
    });
  }

  ajouterItem(): void {
    if (!this.selectedIngredient) {
      alert('Veuillez sélectionner un ingrédient.');
      return;
    }

    if ((this.newItemQuantite === null || this.newItemQuantite <= 0) &&
        (this.newItemPoids === null || this.newItemPoids <= 0)) {
      alert('Veuillez entrer soit une quantité, soit un poids valide.');
      return;
    }

    const ingredientData = this.ingredients.find(ing => ing.nom === this.selectedIngredient);
    if (!ingredientData) return;

    const ingredient = this.fb.group({
      quantite: [this.newItemQuantite ?? null, [Validators.min(1)]],
      poids: [this.newItemPoids ?? null, [Validators.min(1)]],
      id_ingredient: [ingredientData.id, Validators.required],
      nom: [ingredientData.nom]
    });

    this.ingredientsFormArray.push(ingredient);

    this.selectedIngredient = null;
    this.newItemQuantite = null;
    this.newItemPoids = null;
    this.filteredIngredients = [...this.ingredients];
  }

  ouvrirPopup(type: 'clear' | 'delete', index?: number): void {
    this.popupType = type;
    this.popupVisible = true;
    this.itemToDeleteIndex = index ?? null;
  }

  fermerPopup(): void {
    this.popupVisible = false;
    this.popupType = null;
    this.itemToDeleteIndex = null;
  }

  confirmerAction(): void {
    if (this.popupType === 'clear') {
      this.viderFrigo();
    } else if (this.popupType === 'delete' && this.itemToDeleteIndex !== null) {
      this.supprimerItem(this.itemToDeleteIndex);
    }
    this.fermerPopup();
  }

  viderFrigo(): void {
    this.fakeFrigo = [];
    this.ingredientsFormArray.clear();
  }

  supprimerItem(index: number): void {
    this.ingredientsFormArray.removeAt(index);
  }
}
