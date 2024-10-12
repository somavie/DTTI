// models/Pagamento.ts
export interface Pagamento {
  id: number;
  matricula_id: number;
  servico_id: number;
  data_pagamento?: Date;
  valor_pago: number;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
