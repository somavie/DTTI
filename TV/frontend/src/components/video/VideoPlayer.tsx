// pages/video-stream.tsx
"use client";
import React, { useEffect, useRef, useState } from "react";
import { io } from "socket.io-client";

interface CustomHTMLVideoElement extends HTMLVideoElement {
  webkitEnterFullscreen?: () => Promise<void>;
  mozRequestFullScreen?: () => Promise<void>;
  msRequestFullscreen?: () => Promise<void>;
}

const VideoStream = () => {
  const videoRef = useRef<CustomHTMLVideoElement>(null);
  const [currentTime, setCurrentTime] = useState<number>(0);

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

  useEffect(() => {
    const videoElement = videoRef.current;

    // Sincroniza o tempo do vídeo a cada 1 segundo
    const interval = setInterval(syncVideoTime, 1000);

    // Bloquear controle de avanço, recuo e pause
    const handleKeyDown = (event: KeyboardEvent) => {
      if (videoElement) {
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

    window.addEventListener("keydown", handleKeyDown);

    return () => {
      clearInterval(interval);
      window.removeEventListener("keydown", handleKeyDown);
    };
  }, [currentTime]);

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

  const toggleFullScreen = () => {
    const videoElement = videoRef.current;
    if (videoElement) {
      if (videoElement.requestFullscreen) {
        videoElement.requestFullscreen();
      } else if (videoElement.webkitEnterFullscreen) {
        // Safari
        videoElement.webkitEnterFullscreen();
      } else if (videoElement.msRequestFullscreen) {
        // IE/Edge
        videoElement.msRequestFullscreen();
      } else if (videoElement.mozRequestFullScreen) {
        // Firefox
        videoElement.mozRequestFullScreen();
      }
    }
  };

  // Adiciona o evento de clique no vídeo para entrar em tela cheia
  const handleVideoClick = () => {
    toggleFullScreen();
  };

  return (
    <div className="flex justify-center items-center h-screen bg-black">
      <video
        ref={videoRef}
        autoPlay
        playsInline
        className="w-full h-auto"
        onClick={handleVideoClick} // Adiciona o evento de clique
      >
        <source
          src={`${process.env.NEXT_PUBLIC_API_URL}/video-stream`}
          type="video/mp4"
        />
        Seu navegador não suporta o elemento de vídeo.
      </video>
      <style jsx>{`
        video {
          -webkit-appearance: none;
          appearance: none;
          outline: none;
          background-color: black;
          pointer-events: none; /* Desativa interação com o vídeo */
        }
      `}</style>
    </div>
  );
};

export default VideoStream;
