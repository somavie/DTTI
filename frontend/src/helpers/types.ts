export interface Observacao {
  situacao_id: number;
  descricao: string;
}

export interface Equipamento {
  equipamento_id: number;
  quantidade: number;
  status: string;
}

export interface Relatorio {
  observacao_final: string;
  tecnico_cessante_id: number;
  tecnico_entrante_id: number;
}
