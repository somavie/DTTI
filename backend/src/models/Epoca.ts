export interface Epoca {
  id: number;
  descricao: string | null;
  numero: number | null;
  estado: boolean;
  data_criacao: Date;
  data_remocao: Date | null;
  data_alteracao: Date;
  anoLetivo_id: number;
  dataInicio: Date | null;
  dataFim: Date | null;
}
