'use client'

import { useState, useEffect, useMemo } from 'react'
import { Input, Button, Card, CardBody, CardHeader, Spinner } from '@nextui-org/react'
import { Formik, Form, Field, FieldProps } from 'formik'
import { useToast } from "@/hooks/use-toast"
import { Toaster } from "@/components/ui/toaster"
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert'
import { AlertCircle } from 'lucide-react'
import * as Yup from 'yup'
import api from '@/helpers/api'

type GrupoGrsType = {
  id: number
  nome: string
  qtds: number
}

type TurnoType = {
  id: number
  nome: string
}

export default function RegistroDeRadiosOnline() {
  const [grupos, setGrupos] = useState<GrupoGrsType[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const { toast } = useToast()

  const turno = useMemo(() => {
    const horaAtual = new Date().getHours()
    if (horaAtual >= 6 && horaAtual < 12) return { id: 1, nome: 'Manhã' }
    if (horaAtual >= 12 && horaAtual < 18) return { id: 2, nome: 'Tarde' }
    return { id: 3, nome: 'Noite' }
  }, [])

  useEffect(() => {
    const fetchGrupos = async () => {
      try {
        const response = await api.get<GrupoGrsType[]>('/grupo')
        setGrupos(response.data)
      } catch (error) {
        console.error('Erro ao buscar grupos:', error)
        setError('Não foi possível carregar os grupos. Por favor, tente novamente mais tarde.')
      } finally {
        setLoading(false)
      }
    }

    fetchGrupos()
  }, [])

  const validationSchema = useMemo(() => {
    return Yup.object().shape({
      radiosOnline: Yup.object().shape(
        grupos.reduce((acc, grupo) => {
          acc[grupo.id] = Yup.number()
            .required('A quantidade de rádios é obrigatória')
            .min(0, 'A quantidade não pode ser negativa')
            .max(grupo.qtds, `A quantidade não pode ser maior que ${grupo.qtds}`)
          return acc
        }, {} as { [key: string]: Yup.NumberSchema })
      ),
      qtdsTotais: Yup.object().shape(
        grupos.reduce((acc, grupo) => {
          acc[grupo.id] = Yup.number().required()
          return acc
        }, {} as { [key: string]: Yup.NumberSchema })
      ),
    })
  }, [grupos])

  const handleSubmit = async (values: { radiosOnline: { [key: string]: number } }) => {
    try {
      const dataAtual = new Date().toISOString().split('T')[0]

      // Verificar se já existe registro para o turno atual
      const { data } = await api.get(`metricas/data/${dataAtual}/turno/${turno.id}`)
      if (data.length > 0) {
        toast({
          title: 'Aviso',
          description: `Já existe um registro para o turno ${turno.nome}.`,
          duration: 5000,
          variant: 'destructive',
        })
        return
      }

      // Continuar com o registro se não houver duplicação
      const registros = Object.entries(values.radiosOnline).map(([grupoId, qtdsOnline]) => ({
        grupo_id: Number(grupoId),
        turno_id: turno.id,
        relatorio_id: 1,
        qtds_online: qtdsOnline,
        qtds_offline: grupos.find((grupo) => grupo.id === Number(grupoId))?.qtds! - qtdsOnline,
        estado: 1,
      }))

      await Promise.all(registros.map(registro => api.post('/metricas', registro)))

      toast({
        title: 'Sucesso!',
        description: 'Dados registrados com sucesso.',
        duration: 3000,
      })
    } catch (error) {
      console.error('Erro ao registrar dados:', error)
      toast({
        title: 'Erro',
        description: 'Ocorreu um erro ao registrar os dados. Por favor, tente novamente.',
        duration: 5000,
        variant: 'destructive',
      })
    }
  }

  if (loading) {
    return (
      <div className="h-screen flex justify-center items-center">
        <Spinner size="lg" />
      </div>
    )
  }

  if (error) {
    return (
      <div className="container mx-auto px-4 py-8">
        <Alert variant="destructive">
          <AlertCircle className="h-4 w-4" />
          <AlertTitle>Erro</AlertTitle>
          <AlertDescription>{error}</AlertDescription>
        </Alert>
      </div>
    )
  }

  interface FormValues {
    radiosOnline: {
      [key: number]: number;
    };
    qtdsTotais: {
      [key: number]: number;
    };
  }

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold text-center mb-8">Registro de Rádios Online por Grupo</h1>
      <Card className="mb-8">
        <CardBody>
          <h2 className="text-xl font-semibold text-center m-0">
            Turno Atual: <span className="font-bold">{turno.nome}</span>
          </h2>
          <Toaster />
        </CardBody>
      </Card>
      <Formik<FormValues>
        initialValues={{
          radiosOnline: {},
          qtdsTotais: grupos.reduce((acc, grupo) => {
            acc[grupo.id] = grupo.qtds
            return acc
          }, {} as { [key: number]: number })
        }}
        validationSchema={validationSchema}
        onSubmit={handleSubmit}
        enableReinitialize
      >
        {({ errors, touched, isSubmitting }) => (
          <Form>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {grupos.map((grupo) => (
                <Card key={grupo.id} className="w-full">
                  <CardHeader>
                    <h3 className="text-lg font-semibold m-0">{grupo.nome}</h3>
                  </CardHeader>
                  <CardBody>
                    <Field name={`radiosOnline.${grupo.id}`}>
                      {({ field }: FieldProps) => (
                        <div>
                          <Input
                            {...field}
                            type="number"
                            label={`Rádios Online (${grupo.nome})`}
                            placeholder="Quantidade"
                            color={
                              touched.radiosOnline?.[grupo.id] && errors.radiosOnline?.[grupo.id]
                                ? 'danger'
                                : 'default'
                            }
                            fullWidth
                            min={0}
                            max={grupo.qtds}
                            aria-describedby={`error-${grupo.id}`}
                          />
                          {touched.radiosOnline?.[grupo.id] && errors.radiosOnline?.[grupo.id] && (
                            <p
                              id={`error-${grupo.id}`}
                              className="text-danger text-sm mt-1"
                              role="alert"
                            >
                              {errors.radiosOnline[grupo.id]}
                            </p>
                          )}
                        </div>
                      )}
                    </Field>
                    <Field name={`qtdsTotais.${grupo.id}`} type="hidden" value={grupo.qtds} />
                  </CardBody>
                </Card>
              ))}
            </div>
            <div className="mt-8">
              <Button
                type="submit"
                color="primary"
                size="lg"
                className="w-full"
                disabled={isSubmitting}
              >
                {isSubmitting ? <Spinner size="sm" color="danger" /> : 'Salvar Registros'}
              </Button>
            </div>
          </Form>
        )}
      </Formik>
    </div>
  )
}

