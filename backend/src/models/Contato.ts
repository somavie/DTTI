export interface Contato {
  id: number;
  pessoa_id: number;
  tipo: "Telefone" | "Email";
  valor: string;
  estado: boolean;
  data_criacao: Date;
  data_remocao: Date | null;
  data_alteracao: Date;
}
