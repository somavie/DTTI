// components/CardDashboard.tsx
import React from "react";
import { CardBalance } from "./CardBalance";
import {
  FaChalkboardTeacher,
  FaUserGraduate,
  FaUserTie,
  FaUsers,
} from "react-icons/fa";

import {
  useFetchUsuario,
  
} from "../hooks/allselect"; // Importe o hook para usuários

export const CardDashboard: React.FC = () => {
  // Hooks para obter os dados
  
  const { usuarios } = useFetchUsuario();
  

  // Contadores
  const numeroDeProfessores =  0;
  const numeroDeAlunos =  0;
  const numeroDeFuncionarios =  0;
  const numeroDeUsuarios = usuarios ? usuarios.length : 0;
  const numeroDeTurmas = 0;

  return (
    <div className="flex flex-col lg:flex-row gap-6 xl:gap-4">
      <CardBalance
        title="Alunos"
        count={numeroDeAlunos}
        icon={FaUserGraduate}
        bgColor="bg-blue-500"
        textColor="text-white"
      />
      <CardBalance
        title="Professores"
        count={numeroDeProfessores}
        icon={FaUsers}
        bgColor="bg-green-500"
        textColor="text-white"
      />
      <CardBalance
        title="Turmas"
        count={numeroDeTurmas}
        icon={FaUsers}
        bgColor="bg-red-500"
        textColor="text-white"
      />

      <CardBalance
        title="Funcionários"
        count={numeroDeFuncionarios}
        icon={FaUsers}
        bgColor="bg-red-500"
        textColor="text-white"
      />
    </div>
  );
};
function useFetchTurmas(): { usuarios: any } {
  throw new Error("Function not implemented.");
}
