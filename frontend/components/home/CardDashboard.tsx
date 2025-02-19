// CardDashboard.tsx
import React from "react";
import { Card, CardBody, CardHeader, Spinner } from "@nextui-org/react";
import { FaChalkboardTeacher, FaUserCog, FaUserTie, FaUsers, FaDesktop } from "react-icons/fa";
import { useFetchUsuario } from "../hooks/allselect";
import { useFetchData } from "../hooks/useFetchDatas";
import { EquipamentosType, TecnicoType } from "@/helpers/types";

interface CardItemProps {
  title: string;
  count: number;
  icon: React.ComponentType<{ size: number; className: string }>;
  color: string;
}

const CardItem: React.FC<CardItemProps> = ({ title, count, icon: Icon, color }) => (
  <Card className="w-full h-full">
    <CardBody className={`flex flex-row items-center justify-between p-4 ${color}`}>
      <div>
        <p className="text-sm font-medium text-white/80">{title}</p>
        <p className="text-2xl font-bold text-white">{count}</p>
      </div>
      <Icon size={40} className="text-white/80" />
    </CardBody>
  </Card>
);

export const CardDashboard: React.FC = () => {
  const { usuarios, loading: loadingUsuarios } = useFetchUsuario();
  const { data: tecnicos, loading: loadingTecnicos } = useFetchData<TecnicoType>("/tecnicos");
  const { data: equipamentos, loading: loadingEquipamentos } = useFetchData<EquipamentosType>("/equipamentos");

  const isLoading = loadingUsuarios || loadingTecnicos || loadingEquipamentos;

  if (isLoading) {
    return (
      <div className="w-full h-48 flex items-center justify-center">
        <Spinner size="lg" label="Carregando dados..." />
      </div>
    );
  }

  const numeroDeEquipamentos = equipamentos?.length || 0;
  const numeroDeTecnicos = tecnicos?.length || 0;
  const numeroDeUsuarios = usuarios?.length || 0;
  const numeroDeOcorrencias = 0; // Substitua por dados reais quando disponíveis

  const cards = [
    { title: "Tecnicos", count: numeroDeTecnicos, icon: FaUserCog, color: "bg-blue-600" },
    { title: "Meios", count: numeroDeEquipamentos, icon: FaDesktop, color: "bg-purple-600" },
    { title: "Usuários", count: numeroDeUsuarios, icon: FaUsers, color: "bg-pink-600" },
    { title: "Ocorrências", count: numeroDeOcorrencias, icon: FaChalkboardTeacher, color: "bg-green-600" },
  ];

  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
      {cards.map((card, index) => (
        <CardItem key={index} {...card} />
      ))}
    </div>
  );
};