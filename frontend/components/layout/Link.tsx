"use client"

import NextLink, { type LinkProps } from "next/link"
import { useLoading } from "./LoadingContext"

export function Link({ children, ...props }: React.PropsWithChildren<LinkProps>) {
  const { startLoading } = useLoading()

  const handleClick = (e: React.MouseEvent<HTMLAnchorElement>) => {
    if (!e.ctrlKey && !e.metaKey) {
      startLoading()
    }
  }

  return (
    <NextLink {...props} onClick={handleClick}>
      {children}
    </NextLink>
  )
}

