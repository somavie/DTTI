import { Image } from "@nextui-org/react";
import { Divider } from "@nextui-org/divider";

interface Props {
  children: React.ReactNode;
}

export const AuthLayoutWrapper = ({ children }: Props) => {
  return (
    

      
      <div
        className="min-h-screen flex items-center justify-center bg-cover bg-center"
        style={{ backgroundImage: 'url("/bg.jpg")' }}
      >
       {/*<div className="z-10">
          <h1 className="font-bold text-[45px] text-slate-300">
            SISTEMA DE GESTÃO DE OCORRÊNCIAS - DTTI
          </h1>
          <div className="font-light text-slate-300 mt-4">
            LOGIN
          </div>
        </div>*/} 
        
        {children}

      </div>

      
    
  );
};
