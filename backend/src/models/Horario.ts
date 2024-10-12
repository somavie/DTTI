// models/Horario.ts
export interface Horario {
  id: number;
  diaSemana?:
    | "Segunda"
    | "Terça"
    | "Quarta"
    | "Quinta"
    | "Sexta"
    | "Sabado"
    | "Domingo";
  horaInicial?: string; // Representado como "HH:MM:SS"
  horaFinal?: string; // Representado como "HH:MM:SS"
  estado?: boolean;
  data_criacao?: Date;
  data_remocao?: Date;
  data_alteracao?: Date;
  epoca_id: number;
}
