export interface ClasseDisciplina {
  id: number;
  classe_id: number;
  disciplina_id: number;
  estado: boolean;
  data_criacao: Date;
  data_remocao: Date | null;
  data_alteracao: Date;
}
