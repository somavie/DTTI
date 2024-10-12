// models/Matriculas.ts
export interface Matriculas {
  id: number;
  turma_id: number;
  data_matricula?: Date;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
  pessoa_id: number;
}
