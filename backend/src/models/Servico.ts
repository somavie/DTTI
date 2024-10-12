// models/Servico.ts
export interface Servico {
  id: number;
  nome: string;
  preco: number;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
}
