// models/Turno.ts
export interface Turno {
  id: number;
  descricao?: string;
  funcionario_id: number;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
