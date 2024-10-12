export interface Cargo {
  idCargo: number;
  nomeCargo: string;
  descricao: string;
  estado: boolean;
  createdAt: Date;
  updatedAt: Date;
  deletedAt: Date | null;
}
