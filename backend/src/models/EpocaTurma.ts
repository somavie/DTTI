// models/EpocaTurma.ts
export interface EpocaTurma {
  id: number;
  epoca_id: number;
  turma_id: number;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
