// models/Turma.ts
export interface Turma {
  id: number;
  nome: string;
  classe_id: number;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
  turno_id: number;
  sala_id: number;
}
