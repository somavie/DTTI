"use client"

import { useState, useEffect } from 'react'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Bar, BarChart, ResponsiveContainer, XAxis, YAxis, Tooltip, Legend } from 'recharts'
import { ChartContainer, ChartTooltipContent } from "@/components/ui/chart"
import api from "@/helpers/api"

interface ChartData {
  grupo: string
  percentagem: number
}

export function OverallGroupChart() {
  const [interval, setInterval] = useState<'week' | 'month' | 'year'>('week')
  const [chartData, setChartData] = useState<ChartData[]>([])

  useEffect(() => {
    api.get(`/radio-status/groups?interval=${interval}`).then(response => setChartData(response.data))
  }, [interval])

  return (
    <Card>
      <CardHeader>
        <CardTitle>Status Geral dos Grupos</CardTitle>
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
              <XAxis dataKey="grupo" />
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

