"use client";
import React, { useEffect, useRef, useState } from "react";
import io from "socket.io-client";

const VideoPlayer = () => {
  const videoRef = useRef<HTMLVideoElement>(null);
  const [, setCurrentTime] = useState(0);

  useEffect(() => {
    // Conectar ao servidor Socket.IO
    const socket = io("http://192.168.1.183:8088");

    // Solicitar o live stream ao se conectar
    socket.emit("requestLiveStream");

    // Receber o tempo de reprodução sincronizado do servidor
    socket.on("liveStream", (data: { currentTime: number }) => {
      setCurrentTime(data.currentTime);
      if (videoRef.current) {
        videoRef.current.currentTime = data.currentTime;
        videoRef.current.play();
      }
    });

    // Função de limpeza: desconectar o socket ao desmontar o componente
    return () => {
      socket.disconnect();
    };
  }, []);

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-800 text-white">
      <h1 className="text-3xl mb-6">Transmissão ao Vivo</h1>
      <video
        ref={videoRef}
        controls={false} // Desativa os controles para evitar avanço/recuo
        width="800"
        className="border-4 border-gray-500"
      >
        <source src="http://192.168.1.183:8088/video-stream" type="video/mp4" />
        Seu navegador não suporta o elemento de vídeo.
      </video>
    </div>
  );
};

export default VideoPlayer;
