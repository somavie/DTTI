"use client";
import React, { useEffect, useRef, useState } from "react";
import io from "socket.io-client";

const VideoPlayer = () => {
  const videoRef = useRef<HTMLVideoElement>(null);
  const [, setCurrentTime] = useState(0);

  // Função para colocar o vídeo em tela cheia
  const enterFullscreen = () => {
    if (videoRef.current) {
      const videoElement = videoRef.current;

      if (videoElement.requestFullscreen) {
        videoElement.requestFullscreen().catch((err) => {
          console.error("Erro ao tentar entrar em tela cheia:", err);
        });
      }
    }
  };

  useEffect(() => {
    // Conectar ao servidor Socket.IO
    const socket = io(
      process.env.NEXT_PUBLIC_API_URL || "http://localhost:8088"
    );

    // Solicitar o live stream ao se conectar
    socket.emit("requestLiveStream");

    // Receber o tempo de reprodução sincronizado do servidor
    socket.on("liveStream", (data: { currentTime: number }) => {
      setCurrentTime(data.currentTime);
      if (videoRef.current) {
        // Sincroniza o tempo do vídeo
        videoRef.current.currentTime = data.currentTime;

        // Se o vídeo não estiver em reprodução, força o play
        if (videoRef.current.paused) {
          videoRef.current.play().catch((error) => {
            console.error("Erro ao tentar reproduzir:", error);
          });
        }
      }
    });

    // Função de limpeza: desconectar o socket ao desmontar o componente
    return () => {
      socket.disconnect();
    };
  }, []);

  // Bloquear controle de avanço, recuo e pause
  const handleKeyDown = (event: KeyboardEvent) => {
    if (videoRef.current) {
      const videoElement = videoRef.current;
      // Bloqueia espaço e tecla de seta para evitar pausas e avanços
      if (
        event.code === "Space" ||
        event.code === "ArrowLeft" ||
        event.code === "ArrowRight"
      ) {
        event.preventDefault();
        videoElement.currentTime = videoElement.currentTime; // Não permita mudança de tempo
      }
    }
  };

  // Adiciona e remove o listener de evento de teclado
  useEffect(() => {
    window.addEventListener("keydown", handleKeyDown);
    return () => {
      window.removeEventListener("keydown", handleKeyDown);
    };
  }, []);

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-800 text-white">
      <h1 className="text-3xl mb-6">Transmissão ao Vivo</h1>
      <video
        ref={videoRef}
        controls={false} // Desativa os controles para evitar avanço/recuo
        autoPlay // Reproduz automaticamente
        className="w-4/5" // Ocupa 100% da largura e altura da tela
      >
        <source
          src={`${process.env.NEXT_PUBLIC_API_URL}/video-stream`}
          type="video/mp4"
        />
        Seu navegador não suporta o elemento de vídeo.
      </video>
      <button
        onClick={enterFullscreen}
        className="mt-4 p-2 bg-blue-500 rounded hover:bg-blue-600"
      >
        Entrar em Tela Cheia
      </button>
    </div>
  );
};

export default VideoPlayer;
