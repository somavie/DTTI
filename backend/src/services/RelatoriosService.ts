import pool from "../utils/database";
import { RowDataPacket, ResultSetHeader } from "mysql2";

// Interface de Observação
export interface Observacao {
  id: number;
  situacao_id: number;
  descricao: string;
  nome: string;
}

// Interface de Equipamento
export interface Equipamento {
  id: number;
  quantidade: number;
  status: string;
  localizacao: string | null; // Agora aceita null
  nome: string;
}

// Interface para Relatório
export interface Relatorio {
  id: number;
  tecnico_cessante_id: number | null;
  tecnico_entrante_id: number | null;
  entrante?: string;
  cessante?: string;
  data_criacao: Date;
  observacoes_finais: string | null;
  estado: boolean;
  data_criacao_registro: Date;
  data_alteracao: Date;
  observacoes?: Observacao[];
  equipamentos?: Equipamento[];
}

// Criação de um novo relatório (inicialmente com estado ativo)
export const createRelatorioE = async (): Promise<number> => {
  const [result] = await pool.execute<ResultSetHeader>(
    `INSERT INTO relatorios (estado) VALUES (1)`
  );
  return result.insertId;
};

// Criar um novo relatório com dados fornecidos
export const createRelatorio = async (
  relatorio: Omit<Relatorio, "id" | "data_alteracao" | "data_criacao_registro">
): Promise<number> => {
  const [result] = await pool.execute<ResultSetHeader>(
    `INSERT INTO relatorios (tecnico_cessante_id, tecnico_entrante_id, data_criacao, observacoes_finais, estado) 
     VALUES (?, ?, ?, ?, ?)`,
    [
      relatorio.tecnico_cessante_id,
      relatorio.tecnico_entrante_id,
      relatorio.data_criacao,
      relatorio.observacoes_finais,
      relatorio.estado,
    ]
  );
  return result.insertId;
};

// Obter todos os relatórios ativos
export const getAllRelatorios = async (): Promise<Relatorio[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM view_relatorio WHERE estado = 1 ORDER BY data_criacao DESC`
  );
  return rows as Relatorio[];
};

// Obter o último relatório inserido
export const getUltimoRelatorio = async (): Promise<Relatorio | null> => {
  const [relatorioRows] = await pool.query<RowDataPacket[]>(`
    SELECT * 
    FROM relatorios 
    WHERE estado = 1 
    ORDER BY data_criacao DESC 
    LIMIT 1
  `);

  // Verifica se algum relatório foi encontrado
  if (relatorioRows.length === 0) {
    return null; // Retorna null se não houver relatórios ativos
  }

  // Estrutura inicial do objeto Relatório
  const relatorio: Relatorio = {
    id: relatorioRows[0].id,
    tecnico_cessante_id: relatorioRows[0].tecnico_cessante_id,
    tecnico_entrante_id: relatorioRows[0].tecnico_entrante_id,
    data_criacao: relatorioRows[0].data_criacao,
    observacoes_finais: relatorioRows[0].observacoes_finais,
    estado: relatorioRows[0].estado,
    data_criacao_registro: relatorioRows[0].data_criacao_registro,
    data_alteracao: relatorioRows[0].data_alteracao,
    entrante: relatorioRows[0].entrante,
    cessante: relatorioRows[0].cessante,
    equipamentos: [], // Inicialmente vazio, será preenchido se necessário
    observacoes: [], // Inicialmente vazio, será preenchido se necessário
  };

  return relatorio;
};

// Obter um relatório por ID
export const getRelatorioById = async (
  id: number
): Promise<Relatorio | null> => {
  // Consulta os dados do relatório
  const [relatorioRows] = await pool.query<RowDataPacket[]>(
    `SELECT *
     FROM view_relatorio r
     WHERE r.id = ? AND r.estado = 1`,
    [id]
  );

  // Verifica se o relatório existe
  if (relatorioRows.length === 0) {
    return null; // Retorna null se não encontrar o relatório
  }

  // Estrutura inicial do objeto Relatório
  const relatorio: Relatorio = {
    id: relatorioRows[0].relatorio_id,
    data_criacao: relatorioRows[0].data_criacao,
    estado: relatorioRows[0].estado,
    tecnico_entrante_id: relatorioRows[0].tecnico_entrante_id,
    tecnico_cessante_id: relatorioRows[0].tecnico_cessante_id,
    entrante: relatorioRows[0].entrante,
    cessante: relatorioRows[0].cessante,
    equipamentos: [],
    observacoes: [],
    observacoes_finais: relatorioRows[0].observacoes_final,
    data_criacao_registro: new Date(), // Exemplo de inicialização
    data_alteracao: new Date(), // Exemplo de inicialização
  };

  // Consulta equipamentos relacionados ao relatório
  const [equipamentoRows] = await pool.query<RowDataPacket[]>(
    `SELECT *
     FROM view_equipamento e
     WHERE e.relatorios_id = ? AND e.estado = 1`,
    [id]
  );

  // Popula a lista de equipamentos
  equipamentoRows.forEach((row) => {
    relatorio.equipamentos?.push({
      id: row.equipamento_id,
      quantidade: row.quantidade,
      status: row.status,
      localizacao: row.localizacao,
      nome: row.nome,
    });
  });

  // Consulta observações relacionadas ao relatório
  const [observacaoRows] = await pool.query<RowDataPacket[]>(
    `SELECT *
     FROM view_observacao o
     WHERE o.relatorios_id = ? AND o.estado = 1`,
    [id]
  );

  // Popula a lista de observações
  observacaoRows.forEach((row) => {
    relatorio.observacoes?.push({
      id: row.observacao_id,
      situacao_id: row.situacao_id,
      descricao: row.descricao,
      nome: row.nome,
    });
  });

  return relatorio;
};

// Atualizar um relatório por ID
export const updateRelatorio = async (
  id: number,
  updateData: Partial<Omit<Relatorio, "id">>
): Promise<boolean> => {
  const {
    tecnico_cessante_id,
    tecnico_entrante_id,
    data_criacao,
    observacoes_finais,
  } = updateData;

  const [result] = await pool.execute<ResultSetHeader>(
    `UPDATE relatorios 
     SET tecnico_cessante_id = ?, tecnico_entrante_id = ?, data_criacao = ?, observacoes_finais = ?, data_alteracao = ?
     WHERE id = ?`,
    [
      tecnico_cessante_id,
      tecnico_entrante_id,
      data_criacao,
      observacoes_finais,
      new Date(), // Atualiza a data de alteração
      id,
    ]
  );

  return result.affectedRows > 0;
};

// Soft delete de um relatório
export const softDeleteRelatorio = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute<ResultSetHeader>(
    `UPDATE relatorios SET estado = 0 WHERE id = ?`,
    [id]
  );
  return result.affectedRows > 0;
};

// Excluir um relatório permanentemente
export const deleteRelatorio = async (id: number): Promise<boolean> => {
  const [result] = await pool.execute<ResultSetHeader>(
    `DELETE FROM relatorios WHERE id = ?`,
    [id]
  );
  return result.affectedRows > 0;
};
