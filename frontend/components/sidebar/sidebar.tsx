import React from "react";
import Image from "next/image";
import { Sidebar } from "./sidebar.styles";
import { Tooltip } from "@nextui-org/react";
import { CompaniesDropdown } from "./companies-dropdown";
import { HomeIcon } from "../icons/sidebar/home-icon";
import { AccountsIcon } from "../icons/sidebar/accounts-icon";
import { IdentificationIcon } from "../icons/sidebar/identification-icon";
import { ReportsIcon } from "../icons/sidebar/reports-icon";
import { SettingsIcon } from "../icons/sidebar/settings-icon";
import { CollapseItems } from "./collapse-items";
import { useSidebarContext } from "../layout/layout-context";
import { usePathname, useRouter } from "next/navigation";
import { useUserData } from "../hooks/useUserData";
import {
  Calendar,
  LockIcon,
  UserCheckIcon,
  Users,
  UserXIcon,
  SchoolIcon,
  ClipboardListIcon,
  BriefcaseIcon,
  MapPinIcon,
  BookOpenIcon,
  BookAIcon,
  List,
  Radio,
  SmartphoneNfc,
  MonitorCheck,
} from "lucide-react";
import { SidebarItem } from "./sidebar-item";
import { Link } from "../layout/Link";

export const SidebarWrapper = () => {
  const pathname = usePathname();
  const { collapsed, setCollapsed } = useSidebarContext();
  const { userImage, tipoUser } = useUserData();
  const router = useRouter();

  const handleProfileClick = () => {
    router.push("/profile");
  };

  const handleConfClick = () => {
    router.push("/configuracoes");
  };

  return (
    <aside className="h-screen z-[20] sticky top-0">
      {collapsed ? (
        <div className={Sidebar.Overlay()} onClick={setCollapsed} />
      ) : null}
      <div className={Sidebar({ collapsed: collapsed })}>
        <div className={Sidebar.Header()}>
          <CompaniesDropdown />
        </div>
        <div className="flex flex-col justify-between h-full">
          <div className={Sidebar.Body()}>
            <SidebarItem title="Home" icon={<HomeIcon />} href="/" />

            {/* Exibir menus para ADMIN apenas */}
            {(tipoUser === "Admin" || tipoUser === "Operador") && (
              <>
                {/* Módulo: Administração Escolar */}
                <CollapseItems
                  title="Geral"
                  icon={<IdentificationIcon />}
                  items={[
                    {
                      label: "Pessoas",
                      href: "/pessoas", // Alias
                      icon: <Users />,
                    },
                    {
                      label: "Tecnicos",
                      href: "/tecnicos", // Alias
                      icon: <Users />,
                    },

                    {
                      label: "Endereços",
                      href: "/enderecos", // Alias
                      icon: <MapPinIcon />,
                    },
                    {
                      label: "Relatorio",
                      href: "/Relatorio", // Alias
                      icon: <List />,
                    },
                  ]}
                />
                <CollapseItems
                  title="GRS"
                  icon={<IdentificationIcon />}
                  items={[
                    {
                      label: "Radios",
                      href: "/radio", // Alias
                      icon: <Radio />,
                    },
                    {
                      label: "Entidades",
                      href: "/entidade", // Alias
                      icon: <Users />,
                    },
                    {
                      label: "Grupos",
                      href: "/grupos", // Alias
                      icon: <SmartphoneNfc />,
                    },
                    {
                      label: "Adicionar dados",
                      href: "/addQtd", // Alias
                      icon: <MonitorCheck />,
                    },
                  ]}
                />
              </>
            )}
            {tipoUser === "Admin" && (
              <>
                {/* Módulo: Administração */}
                <CollapseItems
                  title="Admin"
                  icon={<AccountsIcon />}
                  items={[
                    {
                      label: "Usuários",
                      href: "/usuarios", // Alias
                      icon: <Users />,
                    },
                    {
                      label: "Tipo de Usuário",
                      href: "/tipo-usuario", // Alias
                      icon: <UserCheckIcon />,
                    },
                  ]}
                />
              </>
            )}

            {(tipoUser === "Admin" || tipoUser === "Tecnico") && (
              <>
                {/* Módulo: Tecnico */}
                <CollapseItems
                  title="Reportar"
                  icon={<AccountsIcon />}
                  items={[
                    {
                      label: "Relatar",
                      href: "/reportar", // Alias
                      icon: <Users />,
                    },
                  ]}
                />
              </>
            )}

            {/* Módulo: Aluno/Encarregado */}
            {(tipoUser === "Admin" || tipoUser === "Tecnico") && (
              <CollapseItems
                title="Minha Conta"
                icon={<ReportsIcon />}
                items={[
                  {
                    label: "Perfil",
                    href: "/profile",
                    icon: <ReportsIcon />,
                  },
                ]}
              />
            )}
          </div>
          <div className={Sidebar.Footer()}>
            <Link href="/configuracoes">
              <Tooltip content={"Configurações"} color="primary">
                <div className="max-w-fit">
                  <SettingsIcon />
                </div>
              </Tooltip>
            </Link>
            <Link href="/profile">
              <Tooltip content={"Perfil"} color="primary">
                <div
                  style={{
                    position: "relative",
                    width: "50px",
                    height: "50px",
                    cursor: "pointer",
                  }}
                  
                >
                  <Image
                    alt="Avatar do Usuário"
                    src={
                      userImage
                        ? `${process.env.NEXT_PUBLIC_API_URL}/uploads/${userImage}`
                        : ""
                    }
                    layout="fill"
                    objectFit="cover"
                    style={{ borderRadius: "50%" }}
                  />
                </div>
              </Tooltip>
            </Link>
          </div>
        </div>
      </div>
    </aside>
  );
};
