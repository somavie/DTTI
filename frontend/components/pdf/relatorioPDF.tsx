import jsPDF from "jspdf";
import autoTable, { UserOptions } from "jspdf-autotable";
import { buscarDadosRelatorio } from "./relatorio";
import { Equipamento, Observacao } from "@/helpers/types";
import { gerarQRCode } from "../QRCode/QRCodeComponent";
import api from '@/helpers/api';
import dayjs from 'dayjs';

// Interface para estender o tipo jsPDF e incluir lastAutoTable
interface jsPDFWithAutoTable extends jsPDF {
  setLineDashPattern(arg0: number[], arg1: number): unknown;
  lastAutoTable?: { finalY: number };
}

// Tipo para os dados do registro
type RegistroType = {
  entries_count: number;
  grupo_nome: string;
  total_online: number;
  qtds_fixa: number;
};

// Função para buscar dados do gráfico
async function fetchGraphData(date: string) {
  try {
    const response = await api.get<RegistroType[]>(`/metricas/data/${date}`);
    return response.data.map((registro) => {
      const totalEsperadoRadios = registro.qtds_fixa * registro.entries_count;
      const porcentagem = (registro.total_online / totalEsperadoRadios) * 100;
      return { grupo: registro.grupo_nome, porcentagem: Math.round(porcentagem) };
    });
  } catch (error) {
    console.error('Erro ao buscar dados do gráfico:', error);
    return [];
  }
}

// Função para desenhar o gráfico com grid e eixos
function drawGraph(doc: jsPDFWithAutoTable, data: { grupo: string; porcentagem: number }[], startY: number) {
  const marginLeft = 30; // Aumentado para acomodar os rótulos do eixo Y
  const marginRight = 15;
  const graphWidth = doc.internal.pageSize.getWidth() - marginLeft - marginRight;
  const graphHeight = 120; // Aumentado para melhor visualização
  const gridSteps = 8; // Número de linhas de grade horizontais
  const maxPercentage = 100; // Valor máximo do eixo Y
  const marginBottom = 25; // Add extra space for group names

  // Desenha o título
  doc.setFontSize(14);
  doc.text("Porcentagem de Rádios Online por Grupo", doc.internal.pageSize.getWidth() / 2, startY, { align: "center" });

  if (data.length === 0) {
    doc.setFontSize(12);
    doc.text("Dados não preenchidos para esta data.", doc.internal.pageSize.getWidth() / 2, startY + 20, { align: "center" });
    return startY + 40;
  }

  const startGraphY = startY + 20;
  const barWidth = (graphWidth - marginLeft) / data.length;

  // Desenha o grid e eixo Y
  doc.setDrawColor(200, 200, 200); // Cor cinza claro para as linhas de grade
  doc.setLineWidth(0.1);

  for (let i = 0; i <= gridSteps; i++) {
    const yPos = startGraphY + graphHeight - (i * graphHeight / gridSteps);
    const percentageValue = (i * maxPercentage / gridSteps).toFixed(0);

    // Linha horizontal pontilhada
    doc.setLineDashPattern([1, 1], 0);
    doc.line(marginLeft, yPos, marginLeft + graphWidth, yPos);

    // Rótulos do eixo Y
    doc.setFontSize(8);
    doc.text(`${percentageValue}%`, marginLeft - 10, yPos, { align: "right" });
  }

  // Eixo Y (linha sólida)
  doc.setLineDashPattern([], 0);
  doc.setDrawColor(100, 100, 100);
  doc.setLineWidth(0.2);
  doc.line(marginLeft, startGraphY + graphHeight, marginLeft, startGraphY);

  // Desenha as barras
  const colors = [
    [141, 147, 236], // Roxo claro
    [152, 223, 175], // Verde claro
    [255, 213, 128], // Amarelo
    [255, 167, 132], // Laranja claro
    [144, 224, 239]  // Azul claro
  ];

  data.forEach((item, index) => {
    const barHeight = (item.porcentagem / maxPercentage) * graphHeight;
    const x = marginLeft + (index * barWidth) + (barWidth * 0.1); // Adiciona espaço entre as barras
    const y = startGraphY + graphHeight - barHeight;
    
    // Desenha a barra
    const [r, g, b] = colors[index % colors.length];
    doc.setFillColor(r, g, b);
    doc.rect(x, y, barWidth * 0.8, barHeight, "F"); // Barra com 80% da largura disponível

    // Rótulo da barra (valor)
    doc.setFontSize(8);
    doc.setTextColor(60, 60, 60);
    doc.text(`${item.porcentagem}%`, x + (barWidth * 0.4), y - 2, { align: "center" });

    // Rótulo do eixo X (grupo)
    doc.setFontSize(8);
    doc.text(item.grupo, x + (barWidth * 0.4), startGraphY + graphHeight + 15, { 
      align: "center",
      maxWidth: barWidth * 0.8 // Ensure text wraps if too long
    });
  });

  // Resetar cores e estilos
  doc.setDrawColor(0);
  doc.setFillColor(0);
  doc.setTextColor(0);
  doc.setLineDashPattern([], 0);

  return startGraphY + graphHeight + marginBottom; // Retorna a posição Y final do gráfico
}

export default async function gerarPDF(relatorioId: number) {
  const doc = new jsPDF() as jsPDFWithAutoTable;

  // Define as margens
  const marginLeft = 15;
  const marginRight = 15;
  const pageHeight = doc.internal.pageSize.getHeight();
  const pageWidth = doc.internal.pageSize.getWidth();
  const usableWidth = pageWidth - marginLeft - marginRight;

  // Busca os dados do relatório
  const { equipamentos, observacoes, entrante, cessante, data_criacao } =
    await buscarDadosRelatorio(relatorioId);

  // Cabeçalho com imagem
  const logoImage = "./logo.png"; // Substitua pelo caminho correto da imagem
  const imageHeight = 30;
  const imageWidth = 30;

  // Adiciona a imagem no topo, centralizada
  const imageXPosition = (pageWidth - imageWidth) / 2;
  doc.addImage(logoImage, "PNG", imageXPosition, 10, imageWidth, imageHeight);

  // Adiciona o texto do cabeçalho logo abaixo da imagem
  doc.setFontSize(14);
  doc.text("Serviço de Inteligência e Segurança Militar", pageWidth / 2, 50, {
    align: "center",
  });
  doc.text(
    "Direção de Telecomunicação e Tecnologia de Informação",
    pageWidth / 2,
    60,
    { align: "center" }
  );

  // Cálculo da data seguinte
  const dataFormatada = new Date(data_criacao).toLocaleDateString("pt-BR", {
    day: "numeric",
    month: "long",
    year: "numeric",
  });
  const dataSeguinte = new Date(
    new Date(data_criacao).setDate(new Date(data_criacao).getDate() + 1)
  );
  const dataSeguinteFormatada = dataSeguinte.toLocaleDateString("pt-BR", {
    day: "numeric",
    month: "long",
    year: "numeric",
  });

  // Assunto (respeita margens)
  const assuntoText = `Assunto: Informe do Técnico - DTTI/SISM referente ao dia ${dataFormatada} à ${dataSeguinteFormatada}`;
  const assuntoLines = doc.splitTextToSize(assuntoText, usableWidth);
  doc.setFontSize(12);
  doc.text(assuntoLines, marginLeft, 70);

  // Texto de introdução (respeita margens)
  const introText =
    "Durante as 24 horas de serviço, os sistemas TIC foram assegurados, destacando-se os seguintes pontos:";
  const introLines = doc.splitTextToSize(introText, usableWidth);
  doc.text(introLines, marginLeft, 85);

  // Adiciona as observações ao PDF (respeita margens)
  let yPosition = 100;
  doc.setFontSize(12);

  observacoes.forEach((obs: Observacao, index: number) => {
    const obsText = `${index + 1}. ${obs.nome}: ${obs.descricao}`;
    const obsLines = doc.splitTextToSize(obsText, usableWidth);

    // Verifica se a próxima linha ultrapassaria a página
    if (yPosition + obsLines.length * 10 > pageHeight - 60) {
      doc.addPage();
      yPosition = 20; // Reinicia a posição Y na nova página
    }

    // Adiciona as observações e ajusta a posição Y
    doc.text(obsLines, marginLeft, yPosition);
    yPosition += obsLines.length * 10 + 5;
  });

  // Definição das colunas e cabeçalhos da tabela
  const headers = ["Meio", "Quantidade", "Estado", "Local"];
  const columns: Array<keyof Equipamento> = [
    "nome",
    "quantidade",
    "status",
    "localizacao",
  ];

  // Configurações personalizadas para formatação das colunas
  const columnConfig: {
    [key in keyof Equipamento]?: (item: Equipamento) => string;
  } = {
    // quantidade: (item) => item.quantidade.toString(),
    // status: (item) =>
    //   item.status === "operacional" ? "Operacional" : "Inativo",
  };

  // Mapeamento do corpo da tabela
  const tableBody = equipamentos.map((item) =>
    columns.map((column) => {
      if (columnConfig[column]) {
        return columnConfig[column]!(item);
      }
      return item[column]?.toString() || "";
    })
  );

  // Renderiza a tabela com autoTable
  const autoTableOptions: UserOptions = {
    head: [headers],
    body: tableBody,
    startY: yPosition,
    styles: {
      cellPadding: 3,
      fontSize: 10,
    },
    headStyles: {
      fillColor: [22, 160, 133],
    },
    margin: { top: 30, left: marginLeft, right: marginRight },
  };

  autoTable(doc, autoTableOptions);

  // Pega a última posição Y após a tabela
  let finalY = doc.lastAutoTable?.finalY || yPosition;

  // Calculate the date for the graph (one day before data_criacao)
  const graphDate = dayjs(data_criacao).subtract(0, 'day').format('YYYY-MM-DD');

  // Fetch graph data
  const graphData = await fetchGraphData(graphDate);

  // Calculate total height needed for graph
  const totalGraphHeight = 180; // Title + graph + margins + labels

  // Check if there's enough space for the graph
  if (finalY + totalGraphHeight > pageHeight - 60) {
    doc.addPage();
    finalY = 20; // Reset Y position to top of new page
  }

  // Add the graph
  const graphY = drawGraph(doc, graphData, finalY + 20);

  // Adjust QR code position
  yPosition = graphY + 20;

  // Verifica se há espaço suficiente para o QR code, senão, adiciona nova página
  if (yPosition + 60 > pageHeight) {
    doc.addPage();
    yPosition = 20; // Posição inicial na nova página
  }

  const qrContent = `Técnico Entrante: ${entrante}, Técnico Cessante: ${cessante}`;
  const qrCode = await gerarQRCode(qrContent, 75, 75);

  // Centraliza e adiciona o QR code no PDF
  const qrXPosition = (pageWidth - 40) / 2; // Centralizar o QR code de 40mm
  doc.addImage(qrCode, "JPEG", qrXPosition, yPosition, 40, 40);

  // Salva o PDF
  doc.save(`relatorio_${relatorioId}.pdf`);
}