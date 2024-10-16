// pages/live.tsx
"use client";
import React from "react";

const LivePage = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-800 text-white">
      <h1 className="text-3xl mb-6">Transmissão ao Vivo</h1>
      <div className="relative w-full h-96">
        <iframe
          src="/video" // A URL da página do vídeo
          className="w-full h-full"
          allow="autoplay; fullscreen"
          allowFullScreen
          title="Live Stream"
        />
      </div>
      <style jsx>{`
        iframe {
          border: none; /* Remove a borda do iframe */
        }
      `}</style>
    </div>
  );
};

export default LivePage;
