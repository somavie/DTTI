import jsPDF from "jspdf";
import { Equipamento, Observacao } from "@/helpers/types";

export default function gerarPDF(
  observacoes: Observacao[], // Alterar para um array de Observacao
  equipamentos: Equipamento[] // Alterar para um array de Equipamento
) {
  const doc = new jsPDF();
  doc.text("Relatório de Equipamentos e Ocorrências", 10, 10);

  // Adiciona as observações ao PDF
  observacoes.forEach((obs, index) => {
    doc.text(`Observação ${index + 1}: ${obs.descricao}`, 10, 20 + index * 10);
  });

  // Adiciona os equipamentos ao PDF
  equipamentos.forEach((equip, index) => {
    doc.text(
      `Equipamento ${index + 1}: ${equip.equipamento_id} - Qtd: ${
        equip.quantidade
      } - Estado: ${equip.status}`,
      10,
      40 + (index + observacoes.length) * 10 // Ajusta a posição com base na quantidade de observações
    );
  });

  // Salva o documento PDF
  doc.save("relatorio.pdf");
}
