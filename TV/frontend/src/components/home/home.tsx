"use client";
import Link from "next/link";

export default function HomeInit() {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-gray-100">
      <header className="mb-8">
        <h1 className="text-4xl font-bold">TV Interativa</h1>
      </header>

      <main className="flex flex-col items-center gap-6">
        <h2 className="text-2xl">Escolha uma opção:</h2>

        {/* Botão para assistir TV */}
        <Link href="/video">
          <div className="px-8 py-4 bg-blue-500 text-white rounded-full hover:bg-blue-600 transition-colors text-lg cursor-pointer">
            Assistir TV
          </div>
        </Link>

        {/* Botão para adicionar vídeos */}
        <Link href="/addVideo">
          <div className="px-8 py-4 bg-green-500 text-white rounded-full hover:bg-green-600 transition-colors text-lg cursor-pointer">
            Adicionar Vídeos
          </div>
        </Link>
      </main>

      <footer className="mt-16">
        <p className="text-sm text-gray-500">
          © {new Date().getFullYear()} TV Interativa. Todos os direitos
          reservados.
        </p>
      </footer>
    </div>
  );
}
