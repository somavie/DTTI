// models/Provincia.ts
export interface Provincia {
  id: number;
  nome: string;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
