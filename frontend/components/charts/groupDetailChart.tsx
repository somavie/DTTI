import React, { useState, useEffect } from 'react';
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { Button } from "@/components/ui/button";
import api from '@/helpers/api';
import clsx from 'clsx';

interface GroupDetailChartProps {
  groupName: string;
  initialInterval: 'week' | 'month' | 'year';
}

const GroupDetailChart: React.FC<GroupDetailChartProps> = ({ groupName, initialInterval }) => {
  const [data, setData] = useState([]);
  const [interval, setInterval] = useState<'week' | 'month' | 'year'>(initialInterval);
  const [isLoading, setIsLoading] = useState(false);

  const fetchData = async () => {
    setIsLoading(true);
    try {
      const response = await api.get(`/radio-status/groups/${groupName}/entities`, { params: { interval } });
      const processedData = response.data.map((entity: { entity_name: string, online_count: number, offline_count: number }) => {
        const total = entity.online_count + entity.offline_count;
        return {
          entity_name: entity.entity_name,
          online_percentage: total > 0 ? (entity.online_count / total) * 100 : 0,
          offline_percentage: total > 0 ? (entity.offline_count / total) * 100 : 0,
        };
      });
      setData(processedData);
    } catch (error) {
      console.error('Error fetching entity status data:', error);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, [interval, groupName]);

  return (
    <Card className="w-full">
      <CardHeader>
        <CardTitle>Detalhes do Grupo: {groupName}</CardTitle>
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
                <XAxis dataKey="entity_name" />
                <YAxis />
                <Tooltip />
                <Legend />
                <Bar dataKey="online_percentage" name="Online %" fill="#4CAF50" />
                <Bar dataKey="offline_percentage" name="Offline %" fill="#f44336" />
              </BarChart>
            </ResponsiveContainer>
          </div>
        )}
      </CardContent>
    </Card>
  );
};

export default GroupDetailChart;

