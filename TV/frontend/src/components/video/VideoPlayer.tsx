"use client";
import React, { useEffect, useRef, useState } from "react";
import io from "socket.io-client";

// Criar uma interface que estenda HTMLVideoElement com os métodos proprietários
interface CustomHTMLVideoElement extends HTMLVideoElement {
  webkitEnterFullscreen?: () => Promise<void>;
  mozRequestFullScreen?: () => Promise<void>;
  msRequestFullscreen?: () => Promise<void>;
}

const VideoPlayer = () => {
  const videoRef = useRef<CustomHTMLVideoElement>(null);
  const [, setCurrentTime] = useState(0);

  // Função para colocar o vídeo em tela cheia, incluindo suporte para dispositivos móveis
  const enterFullscreen = () => {
    if (videoRef.current) {
      const videoElement = videoRef.current;

      // Verifica qual método de tela cheia está disponível
      if (videoElement.requestFullscreen) {
        videoElement.requestFullscreen().catch((err) => {
          console.error("Erro ao tentar entrar em tela cheia:", err);
        });
      } else if (videoElement.webkitEnterFullscreen) {
        // Safari no iOS
        videoElement.webkitEnterFullscreen();
      } else if (videoElement.mozRequestFullScreen) {
        // Firefox
        videoElement.mozRequestFullScreen();
      } else if (videoElement.msRequestFullscreen) {
        // Internet Explorer / Edge
        videoElement.msRequestFullscreen();
      } else {
        console.error("Tela cheia não suportada neste dispositivo.");
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

  // Sincronizar o tempo do vídeo a cada 1 segundo para evitar controle de avanço/recuo
  const syncVideoTime = () => {
    if (videoRef.current) {
      const videoElement = videoRef.current;

      // Sincroniza o tempo do vídeo com o servidor ou outro controle
      const fixedTime = videoElement.currentTime;
      if (Math.abs(videoElement.currentTime - fixedTime) > 1) {
        videoElement.currentTime = fixedTime; // Força o retorno ao tempo correto
      }
    }
  };

  // Adiciona e remove o listener de evento de teclado e sincronização de tempo
  useEffect(() => {
    window.addEventListener("keydown", handleKeyDown);

    // Sincronizar a cada 1 segundo
    const syncInterval = setInterval(syncVideoTime, 1000);

    return () => {
      window.removeEventListener("keydown", handleKeyDown);
      clearInterval(syncInterval);
    };
  }, []);

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-800 text-white">
      <h1 className="text-3xl mb-6">Transmissão ao Vivo</h1>
      <video
        ref={videoRef}
        controls={false} // Desativa os controles para evitar avanço/recuo
        autoPlay // Reproduz automaticamente
        playsInline // Necessário para dispositivos móveis
        // Necessário para autoplay em dispositivos móveis
        className="w-4/5" // Ocupa 80% da largura da tela
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
