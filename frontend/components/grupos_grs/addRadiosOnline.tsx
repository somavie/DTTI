'use client'

import { useState, useEffect } from 'react'
import { Input, Button, Card, CardBody, CardHeader, Spinner, Accordion, AccordionItem, Checkbox } from '@nextui-org/react'
import { useToast } from "@/hooks/use-toast"
import { Toaster } from "@/components/ui/toaster"
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert'
import { AlertCircle } from 'lucide-react'
import api from '@/helpers/api'

type RadioType = {
  id: number;
  identificador: string;
  status: boolean;
}

type EntidadeType = {
  id: number;
  nome: string;
  radios: RadioType[];
}

type GrupoType = {
  id: number;
  nome: string;
  entidades: EntidadeType[];
}

export default function RegistroDeRadiosOnline() {
  const [grupos, setGrupos] = useState<GrupoType[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const { toast } = useToast()

  useEffect(() => {
    const fetchGrupos = async () => {
      try {
        const response = await api.get<GrupoType[]>('/grupo/grupos/with-entidades-and-radios')
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

  const handleRadioStatusChange = async (radioId: number, status: boolean) => {
    try {
      await api.post('/radio-status', {
        radio_id: radioId,
        status,
        usuario: 'Usuario Atual' // Replace with actual user info
      })
      toast({
        title: 'Sucesso!',
        description: 'Status do rádio atualizado com sucesso.',
        duration: 3000,
      })
    } catch (error) {
      console.error('Erro ao atualizar status do rádio:', error)
      toast({
        title: 'Erro',
        description: 'Ocorreu um erro ao atualizar o status do rádio. Por favor, tente novamente.',
        duration: 5000,
        variant: 'destructive',
      })
    }
  }

  const handleSubmitGrupo = async (grupoId: number) => {
    try {
      const grupo = grupos.find(g => g.id === grupoId)
      if (!grupo) return

      const radiosStatus = grupo.entidades.flatMap(entidade => 
        entidade.radios.map(radio => ({
          radio_id: radio.id,
          status: radio.status,
          usuario: 'Usuario Atual' // Replace with actual user info
        }))
      )

      await Promise.all(radiosStatus.map(status => api.post('/radio-status', status)))

      toast({
        title: 'Sucesso!',
        description: `Dados do grupo ${grupo.nome} registrados com sucesso.`,
        duration: 3000,
      })
    } catch (error) {
      console.error('Erro ao registrar dados do grupo:', error)
      toast({
        title: 'Erro',
        description: 'Ocorreu um erro ao registrar os dados do grupo. Por favor, tente novamente.',
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

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold text-center mb-8">Registro de Rádios Online por Grupo</h1>
      <Toaster />
      <Accordion>
        {grupos.map((grupo) => (
          <AccordionItem key={grupo.id} title={grupo.nome}>
            {grupo.entidades.map((entidade) => (
              <Card key={entidade.id} className="mb-4">
                <CardHeader>
                  <h3 className="text-lg font-semibold">{entidade.nome}</h3>
                </CardHeader>
                <CardBody>
                  {entidade.radios.map((radio) => (
                    <div key={radio.id} className="flex items-center justify-between mb-2">
                      <span>{radio.identificador}</span>
                      <Checkbox
                        isSelected={radio.status}
                        onValueChange={(isChecked) => {
                          const updatedGrupos = grupos.map(g => 
                            g.id === grupo.id
                              ? {
                                  ...g,
                                  entidades: g.entidades.map(e => 
                                    e.id === entidade.id
                                      ? {
                                          ...e,
                                          radios: e.radios.map(r => 
                                            r.id === radio.id
                                              ? { ...r, status: isChecked }
                                              : r
                                          )
                                        }
                                      : e
                                  )
                                }
                              : g
                          )
                          setGrupos(updatedGrupos)
                        }}
                      >
                        Online
                      </Checkbox>
                    </div>
                  ))}
                </CardBody>
              </Card>
            ))}
            <Button
              color="primary"
              onClick={() => handleSubmitGrupo(grupo.id)}
              className="mt-4"
            >
              Salvar Registros do Grupo
            </Button>
          </AccordionItem>
        ))}
      </Accordion>
    </div>
  )
}

