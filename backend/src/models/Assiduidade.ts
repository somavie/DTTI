export interface Assiduidade {
  id: number;
  data: Date;
  horaEntrada: string | null;
  horaSaida: string | null;
  resultado: "Presente" | "Ausente" | "Atrasado" | null;
  estado: boolean;
  data_criacao: Date;
  data_remocao: Date | null;
  data_alteracao: Date;
  pessoa_id: number;
}
