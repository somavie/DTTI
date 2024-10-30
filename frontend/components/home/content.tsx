"use client";
import React, { useState, useEffect } from "react";
import { CardDashboard } from "../home/CardDashboard";
import { Spinner } from "@nextui-org/react";
import dynamic from "next/dynamic";
import { Props } from "react-apexcharts";

// Carregar o gráfico dinamicamente
const Chart = dynamic(
  () => import("../charts/steam").then((mod) => mod.Steam),
  {
    ssr: false,
  }
);

export const Content = () => {
  const [loading, setLoading] = useState<boolean>(true);
  const [series, setSeries] = useState<Props["series"]>([]);
  const [categories, setCategories] = useState<string[]>([]);

  useEffect(() => {
    // Simular carregamento de dados
    setTimeout(() => {
      setLoading(false);
      // Aqui você pode adicionar a lógica real para carregar os dados do gráfico
    }, 2000);
  }, []);

  return (
    <div className="max-w-[1400px] mx-auto px-4 sm:px-6 lg:px-8">
      <div className="space-y-6">
        <div className="w-full">
          <CardDashboard />
        </div>
        <div className="w-full bg-content1 shadow-lg rounded-2xl p-6 flex items-center justify-center min-h-[400px]">
          {loading ? (
            <Spinner size="lg" label="Carregando gráfico..." />
          ) : (
            <Chart series={series} categories={categories} />
          )}
        </div>
      </div>
    </div>
  );
};