import { useEffect, useState } from "react";
import api from "@/helpers/api";
import {
  Usuario,
  ProvinciaType,
  TipoUsuarioType,
  PessoaType,
  MunicipioType,
  Endereco, 
} from "@/helpers/types"; // Atualize o caminho conforme necessário


export const useAllPessoas = () => {
  const [pessoas, setPessoas] = useState<PessoaType[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchPessoas = async () => {
      try {
        const response = await api.get("/pessoas");
        setPessoas(response.data);
      } catch (error) {
        console.error("Erro ao buscar pessoas:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchPessoas();
  }, []);

  return { pessoas, loading };
};

export const useAllTiposUsuarios = () => {
  const [tiposUsuario, setTiposUsuario] = useState<TipoUsuarioType[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchTiposUsuario = async () => {
      try {
        const response = await api.get("/tipousuarios");
        setTiposUsuario(response.data);
      } catch (error) {
        console.error("Erro ao buscar tipos de usuário:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchTiposUsuario();
  }, []);

  return { tiposUsuario, loading };
};

export const useFetchTiposUsuario = () => {
  const [tiposUsuario, setTiposUsuario] = useState<TipoUsuarioType[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchTiposUsuario = async () => {
      try {
        const response = await api.get("/tipousuarios");
        setTiposUsuario(response.data);
      } catch (error) {
        console.error("Erro ao buscar tipos de usuário:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchTiposUsuario();
  }, []);

  return { tiposUsuario, loading };
};

export const useFetchUsuario = () => {
  const [usuarios, setUsuarios] = useState<Usuario[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchUsuarios = async () => {
      try {
        const response = await api.get("/auth"); // Ajuste a URL conforme necessário
        setUsuarios(response.data);
      } catch (err) {
        setError("Erro ao carregar usuários");
      } finally {
        setLoading(false);
      }
    };

    fetchUsuarios();
  }, []);

  return { usuarios, loading, error };
};


export const useAllEnderecos = () => {
  const [endereco, setEndereco] = useState<Endereco[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchServicos = async () => {
      try {
        const response = await api.get("/enderecos"); // Ajuste a URL conforme necessário
        setEndereco(response.data);
      } catch (err) {
        setError("Erro ao carregar usuários");
      } finally {
        setLoading(false);
      }
    };

    fetchServicos();
  }, []);

  return { endereco, loading, error };
};

export const useAllProvincias = () => {
  const [provincias, setProvincias] = useState<ProvinciaType[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchProvincias = async () => {
      try {
        const response = await api.get("/provincias"); // Ajuste a URL conforme necessário
        setProvincias(response.data);
      } catch (err) {
        setError("Erro ao carregar províncias");
      } finally {
        setLoading(false);
      }
    };

    fetchProvincias();
  }, []);

  return { provincias, loading, error };
};
export const useAllMunicipios = () => {
  const [municipios, setMunicipios] = useState<MunicipioType[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchMunicipios = async () => {
      try {
        const response = await api.get("/municipios"); // Ajuste a URL conforme necessário
        setMunicipios(response.data);
      } catch (err) {
        setError("Erro ao carregar províncias");
      } finally {
        setLoading(false);
      }
    };

    fetchMunicipios();
  }, []);

  return { municipios, loading, error };
};

