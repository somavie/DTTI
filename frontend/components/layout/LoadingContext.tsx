"use client"

import type React from "react"
import { createContext, useContext, useState, useEffect, Suspense } from "react"
import { usePathname, useSearchParams } from "next/navigation"

type LoadingContextType = {
  isLoading: boolean
  startLoading: () => void
  stopLoading: () => void
  wrapPromise: <T>(promise: Promise<T>) => Promise<T>
}

const LoadingContext = createContext<LoadingContextType | undefined>(undefined)

function LoadingProviderComponent({ children }: { children: React.ReactNode }) {
  const [isLoading, setIsLoading] = useState(false)
  const pathname = usePathname()
  const searchParams = useSearchParams()

  const startLoading = () => setIsLoading(true)
  const stopLoading = () => setIsLoading(false)

  const wrapPromise = async <T,>(promise: Promise<T>): Promise<T> => {
    startLoading()
    try {
      return await promise
    } finally {
      stopLoading()
    }
  }

  useEffect(() => {
    stopLoading()
  }, [pathname, searchParams])

  useEffect(() => {
    const handleStart = () => startLoading()
    const handleStop = () => stopLoading()

    window.addEventListener("beforeunload", handleStart)
    window.addEventListener("load", handleStop)

    return () => {
      window.removeEventListener("beforeunload", handleStart)
      window.removeEventListener("load", handleStop)
    }
  }, [])

  return (
    <LoadingContext.Provider value={{ isLoading, startLoading, stopLoading, wrapPromise }}>
      {children}
    </LoadingContext.Provider>
  )
}

// 🚀 Envolver o `LoadingProviderComponent` com `Suspense`
export function LoadingProvider({ children }: { children: React.ReactNode }) {
  return (
    <Suspense fallback={null}>
      <LoadingProviderComponent>{children}</LoadingProviderComponent>
    </Suspense>
  )
}

export function useLoading() {
  const context = useContext(LoadingContext)
  if (context === undefined) {
    throw new Error("useLoading must be used within a LoadingProvider")
  }
  return context
}
