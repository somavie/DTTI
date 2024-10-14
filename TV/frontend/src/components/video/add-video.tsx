"use client";
import { useState } from "react";
import api from "@/utils/api";

const UploadVideo = () => {
  const [videoFile, setVideoFile] = useState<File | null>(null);
  const [isUploading, setIsUploading] = useState(false);
  const [successMessage, setSuccessMessage] = useState<string | null>(null);

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files) {
      setVideoFile(e.target.files[0]);
      setSuccessMessage(null); // Limpa a mensagem de sucesso ao selecionar um novo arquivo
    }
  };

  const handleUpload = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!videoFile) {
      alert("Por favor, selecione um vídeo para fazer upload.");
      return;
    }

    const formData = new FormData();
    formData.append("video", videoFile);

    setIsUploading(true);

    try {
      await api.post("/videos", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });

      setSuccessMessage("Vídeo enviado com sucesso!");
      setVideoFile(null); // Limpa o arquivo após o upload bem-sucedido
      (document.getElementById("videoFile") as HTMLInputElement).value = ""; // Limpa o campo de input
    } catch (error) {
      console.error("Erro ao enviar o vídeo:", error);
      alert("Erro ao enviar o vídeo. Tente novamente.");
    } finally {
      setIsUploading(false);
    }
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-100 p-8">
      <h1 className="text-3xl font-bold mb-8 text-gray-800">Upload de Vídeo</h1>

      <form
        onSubmit={handleUpload}
        className="w-full max-w-md bg-white p-6 rounded-lg shadow-md space-y-4"
      >
        <div className="flex flex-col space-y-2">
          <label className="text-gray-600 font-semibold" htmlFor="videoFile">
            Selecione um vídeo
          </label>
          <input
            id="videoFile"
            type="file"
            accept="video/*"
            onChange={handleFileChange}
            className="file:bg-blue-500 file:text-white file:rounded-md file:px-4 file:py-2 file:border-none hover:file:bg-blue-600 transition-colors"
          />
        </div>

        <button
          type="submit"
          className={`w-full py-3 mt-4 text-lg font-semibold text-white rounded-lg bg-green-500 hover:bg-green-600 transition-colors ${
            isUploading ? "opacity-50 cursor-not-allowed" : ""
          }`}
          disabled={isUploading}
        >
          {isUploading ? "Enviando..." : "Enviar Vídeo"}
        </button>

        {successMessage && (
          <p className="mt-4 text-green-600 font-medium text-center">
            {successMessage}
          </p>
        )}
      </form>
    </div>
  );
};

export default UploadVideo;
