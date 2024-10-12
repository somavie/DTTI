// models/Funcionario.ts
export interface Funcionario {
  id: number;
  pessoa_id: number;
  cargo_id: number;
  data_admissao?: Date;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
