import { useState, useEffect } from 'react';
import { BarChart, Bar, XAxis, YAxis, Tooltip, CartesianGrid, ResponsiveContainer, Cell } from 'recharts';
import { DatePicker, Spinner } from '@nextui-org/react';
import { CalendarDate, parseDate } from '@internationalized/date';
import dayjs from 'dayjs';
import api from '@/helpers/api';

type RegistroType = {
  entries_count: number;
  grupo_nome: string;
  total_online: number;
  qtds_fixa: number;
};

type GraficoRadiosOnlineProps = {
  defaultDate?: Date;
};

const GraficoRadiosOnline: React.FC<GraficoRadiosOnlineProps> = ({ defaultDate = new Date() }) => {
  const [data, setData] = useState<{ grupo: string; porcentagem: number }[]>([]);
  const [selectedDate, setSelectedDate] = useState<CalendarDate>(parseDate(dayjs(defaultDate).format('YYYY-MM-DD')));
  const [loading, setLoading] = useState(true);

  const colors = ['#8884d8', '#82ca9d', '#ffc658', '#ff8042', '#8dd1e1'];

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      const formattedDate = dayjs(selectedDate.toString()).format('YYYY-MM-DD');
      
      try {
        const response = await api.get<RegistroType[]>(`/metricas/data/${formattedDate}`);
        const registros = response.data;

        const dadosPorGrupo = registros.map((registro) => {
          
          const totalEsperadoRadios = registro.qtds_fixa * registro.entries_count;  // entries_count é o número de turnos reportados
          const porcentagem = (registro.total_online / totalEsperadoRadios) * 100;
          return { grupo: registro.grupo_nome, porcentagem: Math.round(porcentagem) };
        });

        setData(dadosPorGrupo);
      } catch (error) {
        console.error('Erro ao buscar dados:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [selectedDate]);

  const handleDateChange = (value: CalendarDate) => {
    setSelectedDate(value);
  };

  if (loading) {
    return <Spinner size="lg" />;
  }

  return (
    <div className="w-full h-full flex flex-col">
      <DatePicker
        value={selectedDate}
        onChange={handleDateChange}
        label="Selecione a Data"
        className="mb-4"
      />
      <div className="flex-grow">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart data={data} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="grupo" />
            <YAxis domain={[0, 100]} unit="%" />
            <Tooltip formatter={(value: number) => `${value}%`} />
            <Bar
              dataKey="porcentagem"
              barSize={30}
              fill="#8884d8"
              label={{ position: 'top', formatter: (value: number) => `${value}%` }}
            >
              {data.map((entry, index) => (
                <Cell key={`cell-${index}`} fill={colors[index % colors.length]} />
              ))}
            </Bar>
          </BarChart>
        </ResponsiveContainer>
      </div>
    </div>
  );
};

export default GraficoRadiosOnline;

