import React, { useState, useEffect } from 'react';
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { Button } from "@/components/ui/button";
import api from '@/helpers/api';
import clsx from 'clsx'; // Biblioteca para manipulação de classes condicionalmente

const GroupStatusChart: React.FC = () => {
  const [data, setData] = useState([]);
  const [interval, setInterval] = useState<'week' | 'month' | 'year'>('week');
  const [isLoading, setIsLoading] = useState(false);

  const fetchData = async () => {
    setIsLoading(true);
    try {
      const response = await api.get('/radio-status/groups', { params: { interval } });
      const processedData = response.data.map((group: { group_name: string, online_count: number, offline_count: number }) => {
        const total = group.online_count + group.offline_count;
        return {
          group_name: group.group_name,
          online_percentage: total > 0 ? ((group.online_count / total) * 100).toFixed(1) : 0,
          offline_percentage: total > 0 ? ((group.offline_count / total) * 100).toFixed(1) : 0,
        };
      });
      setData(processedData);
    } catch (error) {
      console.error('Error fetching group status data:', error);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, [interval]);

  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle>Status Geral dos Grupos</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="flex justify-center space-x-4 mb-4">
          <Button
            onClick={() => setInterval('week')}
            className={clsx(
              "transition-colors",
              interval === 'week' && "bg-blue-500 text-white hover:bg-blue-600"
            )}
          >
            Semanal
          </Button>
          <Button
            onClick={() => setInterval('month')}
            className={clsx(
              "transition-colors",
              interval === 'month' && "bg-blue-500 text-white hover:bg-blue-600"
            )}
          >
            Mensal
          </Button>
          <Button
            onClick={() => setInterval('year')}
            className={clsx(
              "transition-colors",
              interval === 'year' && "bg-blue-500 text-white hover:bg-blue-600"
            )}
          >
            Anual
          </Button>
        </div>

        {isLoading ? (
          <div>Carregando...</div>
        ) : (
          <div className="h-[400px]">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={data}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="group_name" />
                <YAxis />
                <Tooltip />
                <Legend />
                <Bar dataKey="online_percentage" name="Online" fill="#4CAF50" />
                <Bar dataKey="offline_percentage" name="Offline %" fill="#f44336" />
              </BarChart>
            </ResponsiveContainer>
          </div>
        )}
      </CardContent>
    </Card>
  );
};

export default GroupStatusChart;
