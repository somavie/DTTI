"use client"

import { Dropdown, DropdownItem, DropdownMenu, DropdownTrigger } from "@nextui-org/react"
import type React from "react"
import { useState } from "react"
import { School } from "lucide-react"
import { Image } from "@nextui-org/react"

interface Company {
  name: string
  location: string
  logo: React.ReactNode
}

export const CompaniesDropdown = () => {
  const [company] = useState<Company>({
    name: "SGO-DTTI",
    location: "",
    logo: <Image src="/logo.png" alt="Company Logo" width={80} height={50} className="object-contain" />,
  })

  return (
    <Dropdown
      classNames={{
        base: "w-full min-w-[260px]",
      }}
    >
      <DropdownTrigger className="cursor-pointer">
        <div className="flex items-center gap-1">
          {" "}
          {/* Changed gap-2 to gap-1 */}
          {company.logo}
          <div className="flex flex-col">
            <h3 className="text-xl font-medium m-0 text-foreground whitespace-nowrap leading-none">
              {" "}
              {/* Added leading-none */}
              {company.name}
            </h3>
            <span className="text-xs font-medium text-foreground-500">{company.location}</span>
          </div>
        </div>
      </DropdownTrigger>
      <DropdownMenu aria-label="Ações da Escola">
        <DropdownItem
          key="1"
          startContent={<School />}
          description="Lubango, Huila"
          classNames={{
            base: "py-4",
            title: "text-base font-semibold",
          }}
        >
          ESCOLA
        </DropdownItem>
      </DropdownMenu>
    </Dropdown>
  )
}

