// models/ProfessorTurmaAss.ts
export interface ProfessorTurmaAss {
  id: number;
  assiduidade_id: number;
  professorturma_id: number;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
