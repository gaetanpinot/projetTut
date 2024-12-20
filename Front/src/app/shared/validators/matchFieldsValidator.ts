import { AbstractControl, ValidatorFn } from '@angular/forms';

export function matchFieldsValidator(field1: string, field2: string): ValidatorFn {
  return (form: AbstractControl) => {
    const value1 = form.get(field1)?.value;
    const value2 = form.get(field2)?.value;

    if (value1 !== value2) {
      form.get(field2)?.setErrors({ mismatch: true });
    } else {
      form.get(field2)?.setErrors(null);
    }

    return null;
  };
}
