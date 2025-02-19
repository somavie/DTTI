import "@/styles/globals.css";
import type { Metadata } from "next";
import { Providers } from "./providers";
import { fontSans } from "@/config/fonts";
import clsx from "clsx";
import { RouterProgressBar } from "../components/layout/RouterProgressBar"
import { LoadingProvider } from "../components/layout/LoadingContext"
export const metadata: Metadata = {
  title: "Sistema de Gestão de Ocorrências DTTI",
  description: "CutalaTI",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={clsx("font-sans antialiased", fontSans.className)}>
        <LoadingProvider>
          <RouterProgressBar />
          {children}
        </LoadingProvider>
      </body>
    </html>
  );
}
