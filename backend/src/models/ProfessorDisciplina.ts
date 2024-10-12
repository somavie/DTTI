// models/ProfessorDisciplina.ts
export interface ProfessorDisciplina {
  id: number;
  professor_id: number;
  disciplina_id: number;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
