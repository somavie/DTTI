export interface Classe {
  id: number;
  nome: string;
  curso_id: number;
  estado: boolean;
  data_criacao: Date;
  data_remocao: Date | null;
  data_alteracao: Date;
}
