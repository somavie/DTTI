"use client";

import { createAuthCookie } from "@/actions/auth.action";
import { LoginSchema } from "@/helpers/schemas";
import { LoginFormType } from "@/helpers/types";
import { Button, Card, CardHeader, Input } from "@nextui-org/react";
import { Formik } from "formik";
import Image from "next/image";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useCallback } from "react";
import api from "@/helpers/api";
import React from "react";
import { CardContent } from "@mui/material";

export const Login = () => {
  const router = useRouter();

  const initialValues: LoginFormType = {
    nomeUsuario: "",
    senha: "",
  };

  const handleLogin = useCallback(
    async (values: LoginFormType) => {
      try {
        // Envia uma requisição POST para o backend com nomeUsuario e senha
        const response = await api.post("/auth/login", values);

        // Simula a criação de cookie de autenticação
        await createAuthCookie(response.data.token);

        // Redireciona para a página inicial após autenticação
        router.replace("/");
      } catch (error) {
        console.error("Erro ao fazer login:", error);
      }
    },
    [router]
  );

  return (
    <>
      
      <Card className="w-full max-w-md">
        <CardHeader className="flex flex-col items-center">
          <Image
            src="/logo.png"
            alt="Logo"
            width={150}
            height={150}
            style={{ borderRadius: "80px" }}
            objectFit="cover"
            className="mb-6"
          />
          <h2 className="text-center text-[25px] font-bold mb-6">SISTEMA DE GESTÃO DE OCORRÊNCIAS - DTTI</h2>
        </CardHeader>
        <CardContent>
          <Formik
            initialValues={initialValues}
            validationSchema={LoginSchema}
            onSubmit={handleLogin}
          >
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
                  <div>
                    <Input
                      type="password"
                      placeholder="Senha"
                      value={values.senha}
                      onChange={(e) =>
                        handleChange({
                          target: { name: "senha", value: e.target.value },
                        })
                      }
                      className={errors.senha && touched.senha ? "border-red-500" : ""}
                    />
                    {errors.senha && touched.senha && (
                      <p className="text-red-500 text-sm mt-1">{errors.senha}</p>
                    )}
                  </div>
                </div>
                <Button type="submit" className="w-full">
                  Login
                </Button>
              </form>
            )}
          </Formik>
        </CardContent>
      </Card>
    </>
  );
};
