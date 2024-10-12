export interface AnoLetivo {
  id: number;
  dataInicio: Date | null;
  dataFim: Date | null;
  descricao: string | null;
  estado: boolean;
  data_criacao: Date;
  data_remocao: Date | null;
  data_alteracao: Date;
}
