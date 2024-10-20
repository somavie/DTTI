export interface Observacao {
  situacao_id: number;
  descricao: string;
  nome?: string; // Pode ser string ou null
}

export interface Tecnico {
  id: number;
  nome: string; // Pode ser string ou null
}
export interface Equipamento {
  equipamento_id: number;
  quantidade: number;
  status: string;
  localizacao: string; // Pode ser string ou null
  nome?: string;
}

export interface Relatorio {
  observacao_final: string;
  tecnico_cessante_id: number;
  tecnico_entrante_id: number;
}
// helpers/types.ts

export interface RelatorioDado {
  id: number;
  tecnico_cessante_id: number | null;
  tecnico_entrante_id: number | null;
  cessante: string;
  entrante: string;
  data_criacao: Date;
  observacoes_finais: string | null;
  estado: boolean;
  data_criacao_registro: Date;
  data_alteracao: Date;
  observacoes?: Observacao[];
  equipamentos?: Equipamento[];
}
