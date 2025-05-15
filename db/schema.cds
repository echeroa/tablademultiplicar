namespace tabla_multiplicar;
using { cuid } from '@sap/cds/common';

@assert.unique: { name: [name] }
entity Players : cuid {
  name: String(100) @mandatory;
}

entity Games : cuid {
  playerId: String(100);
  lives: Integer;
  score: Integer;
}

entity Results : cuid {
  playerId: String(100);
  score: Integer;
  registrationDate: Date;
}

