"use client"; // Indica que este componente é um componente cliente
import { useEffect, useState, useRef } from "react";
import { io } from "socket.io-client";
import api from "@/utils/api"; // Certifique-se de que isso está correto

const socket = io(process.env.NEXT_PUBLIC_API_URL); // Conectando ao servidor Socket.io

interface Video {
  id: number;
  nome: string;
  caminho: string;
}

const VideoPlayer = () => {
  const videoRef = useRef<HTMLVideoElement | null>(null);
  const [isPlaying, setIsPlaying] = useState(false);
  const [latestVideo, setLatestVideo] = useState<Video | null>(null);

  useEffect(() => {
    const fetchVideos = async () => {
      try {
        const response = await api.get("/videos");
        const videos: Video[] = response.data;

        if (videos.length > 0) {
          setLatestVideo(videos[videos.length - 1]); // Pega o vídeo mais recente
        }
      } catch (error) {
        console.error("Erro ao buscar vídeos:", error);
      }
    };

    fetchVideos();
    socket.emit("requestLiveStream"); // Solicita a transmissão ao conectar

    socket.on("liveStream", (videoPath: string) => {
      if (videoRef.current) {
        videoRef.current.src = `${process.env.NEXT_PUBLIC_API_URL}${videoPath}`; // Define a fonte do vídeo
        videoRef.current.play();
        setIsPlaying(true); // Define o estado de reprodução
      }
    });

    return () => {
      socket.off("liveStream"); // Remove o listener ao desmontar
    };
  }, []);

  useEffect(() => {
    if (latestVideo && videoRef.current) {
      videoRef.current.src = `${process.env.NEXT_PUBLIC_API_URL}${latestVideo.caminho}`;
      videoRef.current.play();
      setIsPlaying(true);
    }
  }, [latestVideo]);

  const handlePlayPause = () => {
    if (videoRef.current) {
      if (isPlaying) {
        videoRef.current.pause();
      } else {
        videoRef.current.play();
      }
      setIsPlaying(!isPlaying);
    }
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-200">
      <h1 className="text-4xl font-bold mb-6">Bem-vindo à TV Interativa</h1>
      <video
        ref={videoRef}
        onClick={handlePlayPause}
        className="rounded shadow-md"
        width="800"
        controls={false} // Remove os controles do vídeo
      >
        Seu navegador não suporta o elemento de vídeo.
      </video>
      <button
        onClick={handlePlayPause}
        className="mt-4 bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
      >
        {isPlaying ? "Pausar" : "Reproduzir"}
      </button>
    </div>
  );
};

export default VideoPlayer;
