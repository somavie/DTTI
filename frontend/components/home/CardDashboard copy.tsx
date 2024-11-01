// components/CardDashboard.tsx
import React from "react";
import { CardBalance } from "./CardBalance";
import {
  FaChalkboardTeacher,
  FaUserCog,
  FaUserTie,
  FaUsers,
  FaDesktop,
} from "react-icons/fa";

import { useFetchUsuario } from "../hooks/allselect"; // Importe o hook para usuários
import { useFetchData } from "../hooks/useFetchDatas";
import { Equipamento, EquipamentosType, TecnicoType } from "@/helpers/types";

export const CardDashboard: React.FC = () => {
  // Hooks para obter os dados

  const { usuarios } = useFetchUsuario();
  const { data: tecnicos, loading: loadingTecnicos } =
    useFetchData<TecnicoType>("/tecnicos"); // Buscando técnicos
  const { data: equipamentos, loading: loadingequipamentos } =
    useFetchData<EquipamentosType>("/equipamentos"); // Buscando técnicos
  // Contadores
  const numeroDeequipamentos = equipamentos ? equipamentos.length : 0;
  const numeroDeTecnicos = tecnicos ? tecnicos.length : 0;
  const numeroDeFuncionarios = 0;
  const numeroDeUsuarios = usuarios ? usuarios.length : 0;
  const numeroDeTurmas = 0;

  return (
    <div className="flex flex-col lg:flex-row gap-6 xl:gap-4">
      <CardBalance
        title="Tecnicos"
        count={numeroDeTecnicos}
        icon={FaUserCog}
        bgColor="bg-blue-500"
        textColor="text-white"
      />
      <CardBalance
        title="Meios"
        count={numeroDeequipamentos}
        icon={FaDesktop}
        bgColor="bg-green-500"
        textColor="text-white"
      />
    </div>
  );
};
function useFetchTurmas(): { usuarios: any } {
  throw new Error("Function not implemented.");
}
