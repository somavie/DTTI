/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  images: {
    remotePatterns: [
      {
        protocol: "http", // ou 'https', dependendo de como o servidor está configurado
        hostname: process.env.NEXT_PUBLIC_API, // O IP do servidor onde as imagens estão hospedadas
        port: process.env.NEXT_PUBLIC_PORT, // A porta específica que está sendo usada, se necessário
        pathname: "/uploads/**", // O caminho onde as imagens estão localizadasRQ
      },
    ],
    // domains: ["i.pravatar.cc", process.env.NEXT_PUBLIC_API_URL, "localhost"], // Adiciona o domínio i.pravatar.cc e seu domínio de API
  },
  async rewrites() {
    return [
      {
        source: "/pessoas",
        destination: "/admEscolar/gPessoa/pessoa",
      },
      {
        source: "/relatorio",
        destination: "/relatorio",
      },
      {
        source: "/tecnicos",
        destination: "/tecnico",
      },
      {
        source: "/grupos",
        destination: "/grs/grupos",
      },
      {
        source: "/entidade",
        destination: "/grs/entidade",
      },
      {
        source: "/radio",
        destination: "/grs/radio",
      },
      {
        source: "/addQtd",
        destination: "/grs/addQtd",
      },

      {
        source: "/enderecos",
        destination: "/admEscolar/gPessoa/endereco",
      },

      // Rotas de Administração
      {
        source: "/usuarios",
        destination: "/admin/accounts",
      },
      {
        source: "/tipo-usuario",
        destination: "/admin/gUsuarios/tipousuario",
      },

      {
        source: "/perfil",
        destination: "/profile",
      },
      {
        source: "/configuracoes",
        destination: "/admin/configuracao",
      },
    ];
  },
};

module.exports = nextConfig;
