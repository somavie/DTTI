export interface Disciplina {
  id: number;
  nome: string;
  estado: boolean;
  data_criacao: Date;
  data_remocao: Date | null;
  data_alteracao: Date;
}
