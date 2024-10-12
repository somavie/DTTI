// models/ProfessorTurma.ts
export interface ProfessorTurma {
  id: number;
  professor_id: number;
  turma_id: number;
  disciplina_id: number;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
