export interface Curso {
  id: number;
  nome: string;
  descricao: string | null;
  estado: boolean;
  data_criacao: Date;
  data_remocao: Date | null;
  data_alteracao: Date;
}
