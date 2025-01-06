import React, { useState, useEffect } from 'react';
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import api from '@/helpers/api';

interface RadioStatusChartProps {
  radioId: number;
  radioIdentificador: string;
}

const RadioStatusChart: React.FC<RadioStatusChartProps> = ({ radioId, radioIdentificador }) => {
  const [interval, setInterval] = useState<'week' | 'month' | 'year'>('week');
  const [data, setData] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await api.get(`/radio-status/radio/${radioId}/${interval}`);
        setData(response.data);
      } catch (error) {
        console.error('Error fetching radio status data:', error);
      }
    };

    fetchData();
  }, [radioId, interval]);

  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle>Status do Rádio: {radioIdentificador}</CardTitle>
        <Select
            value={interval}
            onValueChange={(value: 'week' | 'month' | 'year') => setInterval(value)}
            >
            <SelectTrigger className="w-[180px]" onClick={(e) => e.stopPropagation()}>
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
        <div className="h-[400px]">
          <ResponsiveContainer width="100%" height="100%">
            <LineChart data={data}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="date" />
              <YAxis />
              <Tooltip />
              <Legend />
              <Line type="monotone" dataKey="online_count" stroke="#4CAF50" name="Online" />
              <Line type="monotone" dataKey="offline_count" stroke="#f44336" name="Offline" />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </CardContent>
    </Card>
  );
};

export default RadioStatusChart;

