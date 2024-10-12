// models/Professor.ts
export interface Professor {
  id: number;
  funcionario_id: number;
  especializacao?: string;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
