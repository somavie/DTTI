"use client"

import { useState, useEffect } from 'react'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Bar, BarChart, ResponsiveContainer, XAxis, YAxis, Tooltip, Legend } from 'recharts'
import { ChartContainer, ChartTooltip, ChartTooltipContent } from "@/components/ui/chart"
import api from "@/helpers/api"
import { 
  eachDayOfInterval, 
  format, 
  subDays, 
  subMonths, 
  subYears, 
  parseISO, 
  startOfWeek,
  endOfWeek,
  startOfMonth,
  endOfMonth,
  eachWeekOfInterval,
  eachMonthOfInterval,
  isSameMonth,
  isSameWeek
} from 'date-fns'
import { ptBR } from 'date-fns/locale'

interface RadioData {
  id: number
  identificador: string
  entidade: string
}

interface ChartData {
  date: string
  online: number
  offline: number
}

export function IndividualRadioChart() {
  const [radios, setRadios] = useState<RadioData[]>([])
  const [selectedRadio, setSelectedRadio] = useState<string>('')
  const [interval, setInterval] = useState<'week' | 'month' | 'year'>('week')
  const [chartData, setChartData] = useState<ChartData[]>([])

  useEffect(() => {
    api.get('/radios').then(response => setRadios(response.data))
  }, [])

  useEffect(() => {
    if (selectedRadio) {
      api.get(`/radio-status/radio/${selectedRadio}/${interval}`).then(response => {
        const rawData = response.data;
        
        let startDate;
        let aggregatedData;

        switch(interval) {
          case 'week':
            startDate = subDays(new Date(), 6);
            // For weekly view, keep daily data
            aggregatedData = eachDayOfInterval({ start: startDate, end: new Date() })
              .map(date => {
                const formattedDate = format(date, 'yyyy-MM-dd');
                const existingData = rawData.find((d: any) => 
                  format(parseISO(d.date), 'yyyy-MM-dd') === formattedDate
                );
                return {
                  date: formattedDate,
                  online: existingData ? parseInt(existingData.online) : 0,
                  offline: existingData ? parseInt(existingData.offline) : 0
                };
              });
            break;

          case 'month':
            startDate = subMonths(new Date(), 1);
            // Aggregate by weeks
            const weeks = eachWeekOfInterval(
              { start: startDate, end: new Date() },
              { weekStartsOn: 1 }
            );
            
            aggregatedData = weeks.map(weekStart => {
              const weekEnd = endOfWeek(weekStart, { weekStartsOn: 1 });
              const weekData = rawData.filter((d: any) => {
                const date = parseISO(d.date);
                return isSameWeek(date, weekStart, { weekStartsOn: 1 });
              });

              const online = weekData.reduce((sum: number, d: any) => 
                sum + parseInt(d.online), 0);
              const offline = weekData.reduce((sum: number, d: any) => 
                sum + parseInt(d.offline), 0);

              return {
                date: format(weekStart, 'yyyy-MM-dd'),
                online,
                offline,
                label: `Semana ${format(weekStart, 'w')}`
              };
            });
            break;

          case 'year':
            startDate = subYears(new Date(), 1);
            // Aggregate by months
            const months = eachMonthOfInterval(
              { start: startDate, end: new Date() }
            );
            
            aggregatedData = months.map(monthStart => {
              const monthEnd = endOfMonth(monthStart);
              const monthData = rawData.filter((d: any) => {
                const date = parseISO(d.date);
                return isSameMonth(date, monthStart);
              });

              const online = monthData.reduce((sum: number, d: any) => 
                sum + parseInt(d.online), 0);
              const offline = monthData.reduce((sum: number, d: any) => 
                sum + parseInt(d.offline), 0);

              return {
                date: format(monthStart, 'yyyy-MM-dd'),
                online,
                offline
              };
            });
            break;
        }
        
        setChartData(aggregatedData);
      });
    }
  }, [selectedRadio, interval])

  const getTickFormatter = (interval: string) => (value: string) => {
    if (typeof value !== 'string' || !value) return '';
    
    const date = parseISO(value);
    switch (interval) {
      case 'week':
        return format(date, 'dd/MM');
      case 'month':
        return `Semana ${format(date, 'w')}`;
      case 'year':
        return format(date, 'MMM', { locale: ptBR });
      default:
        return value;
    }
  };

  const getTooltipFormatter = (value: string) => {
    if (typeof value !== 'string' || !value) return '';
    const date = parseISO(value);
    
    switch (interval) {
      case 'week':
        return format(date, 'dd/MM/yyyy');
      case 'month':
        return `Semana ${format(date, 'w')} (${format(date, 'dd/MM/yyyy')})`;
      case 'year':
        return format(date, 'MMMM/yyyy', { locale: ptBR });
      default:
        return value;
    }
  };

  return (
    <Card>
      <CardHeader>
        <CardTitle>Status Individual do Rádio</CardTitle>
        <div className="flex space-x-4">
          <Select onValueChange={setSelectedRadio} value={selectedRadio}>
            <SelectTrigger className="w-[180px]">
              <SelectValue placeholder="Selecione um rádio" />
            </SelectTrigger>
            <SelectContent>
              {radios.map(radio => (
                <SelectItem key={radio.id} value={radio.id.toString()}>
                  {radio.identificador} ({radio.entidade})
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
            online: {
              label: "Online",
              color: "hsl(var(--chart-1))",
            },
            offline: {
              label: "Offline",
              color: "hsl(var(--chart-2))",
            },
          }}
          className="h-[400px]"
        >
          <ResponsiveContainer width="100%" height={400}>
            <BarChart data={chartData} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
              <XAxis 
                dataKey="date" 
                tickFormatter={getTickFormatter(interval)}
              />
              <YAxis />
              <Tooltip 
                content={<ChartTooltipContent />}
                labelFormatter={getTooltipFormatter}
              />
              <Legend />
              <Bar dataKey="online" stackId="a" fill="var(--color-online)" />
              <Bar dataKey="offline" stackId="a" fill="var(--color-offline)" />
            </BarChart>
          </ResponsiveContainer>
        </ChartContainer>
      </CardContent>
    </Card>
  )
}

