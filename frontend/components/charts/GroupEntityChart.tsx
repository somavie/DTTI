"use client"

import { useState, useEffect } from 'react'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Bar, BarChart, ResponsiveContainer, XAxis, YAxis, Tooltip, Legend } from 'recharts'
import { ChartContainer, ChartTooltipContent } from "@/components/ui/chart"
import api from "@/helpers/api"

interface GroupData {
  id: number
  nome: string
}

interface ChartData {
  entidade: string
  percentagem: number
}

export function GroupEntityChart() {
  const [groups, setGroups] = useState<GroupData[]>([])
  const [selectedGroup, setSelectedGroup] = useState<string>('')
  const [interval, setInterval] = useState<'week' | 'month' | 'year'>('week')
  const [chartData, setChartData] = useState<ChartData[]>([])

  useEffect(() => {
    api.get('/grupo').then(response => setGroups(response.data))
  }, [])

  useEffect(() => {
    if (selectedGroup) {
      api.get(`/radio-status/groups/${selectedGroup}/entities?interval=${interval}`).then(response => setChartData(response.data))
    }
  }, [selectedGroup, interval])

  return (
    <Card>
      <CardHeader>
        <CardTitle>Status das Entidades do Grupo</CardTitle>
        <div className="flex space-x-4">
          <Select onValueChange={setSelectedGroup} value={selectedGroup}>
            <SelectTrigger className="w-[180px]">
              <SelectValue placeholder="Selecione um grupo" />
            </SelectTrigger>
            <SelectContent>
              {groups.map(group => (
                <SelectItem key={group.id} value={group.id.toString()}>
                  {group.nome}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
          <Select onValueChange={(value) => setInterval(value as 'week' | 'month' | 'year')} value={interval}>
            <SelectTrigger className="w-[180px]">
              <SelectValue placeholder="Selecione o intervalo" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="week">Semanal</SelectItem>
              <SelectItem value="month">Mensal</SelectItem>
              <SelectItem value="year">Anual</SelectItem>
            </SelectContent>
          </Select>
        </div>
      </CardHeader>
      <CardContent>
        <ChartContainer
          config={{
            percentagem: {
              label: "Percentagem Online",
              color: "hsl(var(--chart-1))",
            },
          }}
          className="h-[400px]"
        >
          <ResponsiveContainer width="100%" height={400}>
            <BarChart data={chartData} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
              <XAxis dataKey="entidade" />
              <YAxis />
              <Tooltip content={<ChartTooltipContent />} />
              <Legend />
              <Bar dataKey="percentagem" fill="var(--color-percentagem)" />
            </BarChart>
          </ResponsiveContainer>
        </ChartContainer>
      </CardContent>
    </Card>
  )
}

