import municipio from "@/app/(app)/admin/configuracao/municipio/page";
import { number, mixed, boolean, object, ref, date, string } from "yup";
import * as yup from "yup";

import * as Yup from "yup";

// helpers/validators.ts

export const validateRelatorioForm = (data: any) => {
  const errors: { [key: string]: string } = {};

  if (!data.tecnico_cessante_id) {
    errors.tecnico_cessante_id = "Técnico cessante é obrigatório.";
  }
  if (!data.tecnico_entrante_id) {
    errors.tecnico_entrante_id = "Técnico entrante é obrigatório.";
  }
  if (!data.observacao_final) {
    errors.observacao_final = "A observação final é obrigatória.";
  }

  return {
    isValid: Object.keys(errors).length === 0,
    errors,
  };
};

export const RelatorioSchema = Yup.object().shape({
  tecnico_cessante_id: Yup.number()
    .required("O campo 'Técnico Cessante' é obrigatório.")
    .positive("O ID do técnico cessante deve ser um número positivo.")
    .integer("O ID do técnico cessante deve ser um número inteiro."),

  tecnico_entrante_id: Yup.number()
    .required("O campo 'Técnico Entrante' é obrigatório.")
    .positive("O ID do técnico entrante deve ser um número positivo.")
    .integer("O ID do técnico entrante deve ser um número inteiro."),

  data_criacao: Yup.date()
    .required("A data de criação é obrigatória.")
    .typeError("A data de criação deve ser uma data válida."),

  observacoes_finais: Yup.string()
    .max(500, "As observações finais não podem ter mais de 500 caracteres.")
    .nullable(),
});


export const LoginSchema = yup.object().shape({
  nomeUsuario: yup.string().required("Nome de usuário é obrigatório"),
  senha: yup.string().required("Senha é obrigatória"),
});

export const UsuarioSchema = yup.object().shape({
  pessoa_id: yup
    .number()
    .integer("O campo pessoa_id deve ser um número inteiro")
    .required("O campo pessoa_id é obrigatório"),

  nomeUsuario: yup
    .string()
    .max(50, "O nome de usuário pode ter no máximo 50 caracteres")
    .required("O campo nomeUsuario é obrigatório"),

  senha: yup
    .string()
    .min(8, "A senha deve ter no mínimo 8 caracteres")
    .optional(),

  confirmPassword: yup
    .string()
    .oneOf([yup.ref("senha")], "As senhas não coincidem")
    .optional(),

  tipo_usuario_id: yup
    .number()
    .integer("O campo tipo_usuario_id deve ser um número inteiro")
    .required("O campo tipo_usuario_id é obrigatório"),

  delete_permissao: yup.boolean().optional(), // Campo opcional

  update_permissao: yup.boolean().optional(), // Campo opcional

  view_permissao: yup.boolean().optional(), // Campo opcional

  create_permissao: yup.boolean().optional(), // Campo opcional

  estado: yup.boolean().optional(), // Campo opcional
});

export const RegisterSchema = yup.object().shape({
  pessoa_id: yup.number().required("O ID da pessoa é obrigatório"),
  nomeUsuario: yup
    .string()
    .required("O nome de usuário é obrigatório")
    .min(3, "O nome de usuário deve ter pelo menos 3 caracteres"),
  senha: yup
    .string()
    .required("A senha é obrigatória")
    .min(6, "A senha deve ter pelo menos 6 caracteres"),
  confirmPassword: yup
    .string()
    .oneOf([yup.ref("senha")], "As senhas não coincidem")
    .required("A confirmação da senha é obrigatória"),
  tipo_usuario_id: yup.number().required("O tipo de usuário é obrigatório"),
});

export const CargoSchema = object().shape({
  nome: string().required("Nome é obrigatório"),
  descricao: string().required("Descrição é obrigatório"),
});

export const MunicipioSchema = object().shape({
  nome: string().required("Nome é obrigatório"),
  provincia_id: string().required("Provincia é obrigatório"),
});

export const PermissaoSchema = object().shape({
  usuario_id: number().required("O ID do usuário é obrigatório"),
  delete_permissao: boolean().nullable(), // Permite que seja nulo
  update_permissao: boolean().nullable(), // Permite que seja nulo
  view_permissao: boolean().nullable(), // Permite que seja nulo
  create_permissao: boolean().nullable(), // Permite que seja nulo
});

export const PessoaSchema = object().shape({
  nome: yup.string().required("Nome é obrigatório"),
  data_nascimento: yup.string().required("Data de nascimento é obrigatória"),
  genero: yup
    .string()
    .oneOf(["Masculino", "Feminino", "Outro"])
    .required("Gênero é obrigatório"),
  endereco_id: yup.number().optional(),
  municipio_id: yup.number().optional(),
});
export const TecnicoSchema = object().shape({
  genero: yup
    .string()
    .oneOf(["Masculino", "Feminino", "Outro"])
    .required("Gênero é obrigatório"),
});
export const GrupoSchema = object().shape({
  nome: yup.string().required("Nome é obrigatório"),
  qtds: number().required("A quantidade de radios no grupo"),
});


export const ProvinciaSchema = object().shape({
  nome: string()
    .required("O nome da província é obrigatório")
    .max(100, "O nome pode ter no máximo 100 caracteres"),
});

export const TipoUsuarioSchema = object().shape({
  nome: string()
    .required("O nome é obrigatório")
    .max(50, "O nome pode ter no máximo 50 caracteres"),
  descricao: string().optional(), // Descrição é opcional
});

export const EnderecoSchema = object().shape({
  municipio_id: number().integer().required("O nome é obrigatório"),
  numero_casa: string()
    .nullable()
    .max(200, "O Descriçao pode ter no máximo 200 caracteres"),
  bairro: string()
    .nullable()
    .max(200, "O Descriçao pode ter no máximo 200 caracteres"),
});

// Schema para criação de usuário (com senha)
export const UsuarioCreateSchema = object().shape({
  pessoa_id: number()
    .integer("O campo pessoa_id deve ser um número inteiro")
    .required("O campo pessoa_id é obrigatório"),

  nomeUsuario: string()
    .max(50, "O nome de usuário pode ter no máximo 50 caracteres")
    .required("O campo nomeUsuario é obrigatório"),

  senha: string()
    .min(8, "A senha deve ter no mínimo 8 caracteres")
    .required("O campo senha é obrigatório"),

  confirmPassword: string()
    .oneOf([yup.ref("senha")], "As senhas não coincidem")
    .required("A confirmação da senha é obrigatória"),

  tipo_usuario_id: number()
    .integer("O campo tipo_usuario_id deve ser um número inteiro")
    .required("O campo tipo_usuario_id é obrigatório"),

  delete_permissao: boolean().notRequired(), // Campo opcional
  update_permissao: boolean().notRequired(), // Campo opcional
  view_permissao: boolean().notRequired(), // Campo opcional
  create_permissao: boolean().notRequired(), // Campo opcional
  estado: boolean().notRequired(), // Campo opcional
});

// Schema para edição de usuário (sem senha)
export const UsuarioEditSchema = object().shape({
  pessoa_id: number()
    .integer("O campo pessoa_id deve ser um número inteiro")
    .required("O campo pessoa_id é obrigatório"),

  nomeUsuario: string()
    .max(50, "O nome de usuário pode ter no máximo 50 caracteres")
    .required("O campo nomeUsuario é obrigatório"),

  tipo_usuario_id: number()
    .integer("O campo tipo_usuario_id deve ser um número inteiro")
    .required("O campo tipo_usuario_id é obrigatório"),

  delete_permissao: boolean().notRequired(), // Campo opcional
  update_permissao: boolean().notRequired(), // Campo opcional
  view_permissao: boolean().notRequired(), // Campo opcional
  create_permissao: boolean().notRequired(), // Campo opcional
  estado: boolean().notRequired(), // Campo opcional
});

// Outros schemas permanecem inalterados

export const MeioSchema = yup.object().shape({
  tipo_meio: yup.string().required("Nome é obrigatório"),
  estado_meio: yup
    .mixed<"Bom" | "Mau" | "Razoavel">()
    .oneOf(
      ["Bom", "Mau", "Razoavel"],
      "Estado do meio é obrigatório e deve ser um dos seguintes: Bom, Mau, Razoável"
    )
    .required("Estado do meio é obrigatório"),
  estado: yup.boolean().default(true), // Estado do meio, padrão é ativo
});

export const EntidadeSchema = Yup.object().shape({
  nome: Yup.string().required('Nome é obrigatório'),
  indicativo: Yup.number().required('Indicativo é obrigatório'),
  grupo_id: Yup.number().required('Grupo é obrigatório'),
});

export const RadioSchema = Yup.object().shape({
  numero_serie: Yup.string().required('Número de série é obrigatório'),
  identificador: Yup.string().required('Identificador é obrigatório'),
  localizacao: Yup.string(),
  situacao: Yup.string(),
  entidade_id: Yup.number().required('Entidade é obrigatória'),
});
