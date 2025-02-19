"use client"

import { useState, useEffect } from "react"
import { Progress } from "@/components/ui/progress"
import { useLoading } from "./LoadingContext"

export function RouterProgressBar() {
  const [progress, setProgress] = useState(0)
  const { isLoading } = useLoading()

  useEffect(() => {
    let timer: NodeJS.Timeout

    if (isLoading) {
      setProgress(0)
      timer = setInterval(() => {
        setProgress((oldProgress) => (oldProgress >= 90 ? 90 : oldProgress + 10))
      }, 200)
    } else {
      setProgress(100)
      timer = setTimeout(() => setProgress(0), 500)
    }

    return () => {
      clearInterval(timer)
      clearTimeout(timer)
    }
  }, [isLoading])

  if (progress === 0) return null

  return (
    <Progress
      value={progress}
      className="fixed top-0 left-0 right-0 z-50 h-1 w-full bg-blue-500 transition-all"
    />
  )
}
