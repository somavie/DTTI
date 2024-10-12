export interface Documento {
  id: number;
  pessoa_id: number;
  tipo: "BI" | "Passaporte" | "Outro";
  numero: string;
  data_validade: Date | null;
  estado: boolean;
  data_criacao: Date;
  data_remocao: Date | null;
  data_alteracao: Date;
}
