// models/Provas.ts
export interface Provas {
  id: number;
  matricula_id: number;
  disciplina_id: number;
  tipo_prova_id: number;
  nota: number; // Decimal em MySQL pode ser representado como `number` em TypeScript.
  data_prova?: Date;
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
  epoca_id: number;
}
