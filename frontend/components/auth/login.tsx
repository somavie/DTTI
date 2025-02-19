"use client"

import { createAuthCookie } from "@/actions/auth.action"
import { LoginSchema } from "@/helpers/schemas"
import type { LoginFormType } from "@/helpers/types"
import { Button, Card, CardHeader, Input } from "@nextui-org/react"
import { Formik } from "formik"
import Image from "next/image"
import { useRouter } from "next/navigation"
import { useCallback, useState } from "react"
import api from "@/helpers/api"
import React from "react"
import { CardContent } from "@mui/material"
import { Eye, EyeOff } from "lucide-react"
import { useLoading } from "../layout/LoadingContext"

export const Login = () => {
  const router = useRouter()
  const [showPassword, setShowPassword] = useState(false)
  const { wrapPromise } = useLoading()

  const initialValues: LoginFormType = {
    nomeUsuario: "",
    senha: "",
  }

  const handleLogin = useCallback(
    async (values: LoginFormType) => {
      try {
        await wrapPromise(
          (async () => {
            // Envia uma requisição POST para o backend com nomeUsuario e senha
            const response = await api.post("/auth/login", values)

            // Simula a criação de cookie de autenticação
            await createAuthCookie(response.data.token)

            // Redireciona para a página inicial após autenticação
            router.replace("/")
          })(),
        )
      } catch (error) {
        console.error("Erro ao fazer login:", error)
      }
    },
    [router, wrapPromise],
  )

  return (
    <Card className="w-full max-w-md shadow-lg">
      <CardHeader className="flex flex-col items-center space-y-6 pb-10">
        <div className="relative w-32 h-32 overflow-hidden rounded-full border-4 border-primary shadow-md">
          <Image src="/logo.png" alt="Logo" layout="fill" objectFit="cover" />
        </div>
        <h2 className="text-center text-2xl font-bold tracking-tight">SISTEMA DE GESTÃO DE OCORRÊNCIAS - DTTI</h2>
      </CardHeader>
      <CardContent>
        <Formik initialValues={initialValues} validationSchema={LoginSchema} onSubmit={handleLogin}>
          {({ values, errors, touched, handleChange, handleSubmit }) => (
            <form onSubmit={handleSubmit} className="space-y-6">
              <div className="space-y-4">
                <div>
                  <Input
                    type="text"
                    placeholder="Nome de Usuário"
                    value={values.nomeUsuario}
                    onChange={(e) =>
                      handleChange({
                        target: { name: "nomeUsuario", value: e.target.value },
                      })
                    }
                    className={errors.nomeUsuario && touched.nomeUsuario ? "border-red-500" : ""}
                  />
                  {errors.nomeUsuario && touched.nomeUsuario && (
                    <p className="text-red-500 text-sm mt-1">{errors.nomeUsuario}</p>
                  )}
                </div>
                <div className="relative">
                  <Input
                    type={showPassword ? "text" : "password"}
                    placeholder="Senha"
                    value={values.senha}
                    onChange={(e) =>
                      handleChange({
                        target: { name: "senha", value: e.target.value },
                      })
                    }
                    className={errors.senha && touched.senha ? "border-red-500 pr-10" : "pr-10"}
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="absolute inset-y-0 right-0 flex items-center pr-3"
                  >
                    {showPassword ? (
                      <EyeOff className="h-4 w-4 text-gray-400" />
                    ) : (
                      <Eye className="h-4 w-4 text-gray-400" />
                    )}
                  </button>
                  {errors.senha && touched.senha && <p className="text-red-500 text-sm mt-1">{errors.senha}</p>}
                </div>
              </div>
              <Button type="submit" className="w-full bg-primary hover:bg-primary/90 text-white">
                Login
              </Button>
            </form>
          )}
        </Formik>
      </CardContent>
    </Card>
  )
}

