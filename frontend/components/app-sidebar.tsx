"use client"
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarSeparator,
} from "@/components/ui/sidebar"
import { useGlobal } from "@/app/context/GlobalContext"
import Image from "next/image"
import Link from "next/link"
import { Trash2, Search } from "lucide-react"
import { Button } from "@/components/ui/button"
import { DropdownMenu } from "@radix-ui/react-dropdown-menu"

export function AppSidebar() {
  const { shoppingList, setShoppingList } = useGlobal()

  function removeItem(product: {item: string, imgSrc: string}) {
    return () => {
      setShoppingList(shoppingList.filter((item) => item.item !== product.item || item.imgSrc !== product.imgSrc));
    }
  }

  return (
    <Sidebar side="right"
      className="fixed top-0 right-0 h-screen w-[16rem] z-[9998] shadow-lg bg-background transition-transform duration-300"
    >
      <SidebarHeader>
        <div className="px-2 py-2">
          <h2 className="text-lg font-semibold">Shopping Cart</h2>
          <p className="text-sm text-muted-foreground">
            {shoppingList.length} {shoppingList.length === 1 ? 'item' : 'items'}
          </p>
        </div>
      </SidebarHeader>

      <SidebarContent>
        <SidebarGroup>
          <SidebarGroupLabel>Your Items</SidebarGroupLabel>
          <SidebarGroupContent>
            {shoppingList.length === 0 ? (
              <div className="px-2 py-4 text-center text-muted-foreground">
                <p>Your cart is empty</p>
                <p className="text-xs">Add items to get started</p>
              </div>
            ) : (
              <SidebarMenu>
                {shoppingList.map((item, index) => (
                  <SidebarMenuItem key={index} className="w-full flex flex-row justify-between items-center hover:bg-gray-200 dark:hover:bg-gray-700">
                    <div className="flex gap-2">
                      <Image
                        src={item.imgSrc}
                        alt={item.item}
                        width={24}
                        height={24}
                        className="rounded-md object-cover"
                      />
                      <span className="flex-1 text-left truncate">{item.item}</span>
                      <DropdownMenu />
                    </div>
                    <button className="justify-end hover:scale:110 hover:brightness-80" onClick={removeItem(item)}>
                      <Image src="/stop-transparent.png" alt="Delete" width={30} height={30}/>
                    </button>
                  </SidebarMenuItem>
                ))}
              </SidebarMenu>
            )}
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>

      {shoppingList.length > 0 && (
        <>
          <SidebarSeparator />
          <SidebarFooter>
            <SidebarMenu>
              <SidebarMenuItem>
                <SidebarMenuButton
                  onClick={() => setShoppingList([])}
                  className="w-full text-destructive hover:text-destructive"
                >
                  <Trash2 className="h-4 w-4" />
                  <span>Clear Cart</span>
                </SidebarMenuButton>
              </SidebarMenuItem>
              <SidebarMenuItem>
                <Link href="/results" className="w-full">
                  <SidebarMenuButton className="w-full">
                    <Search className="h-4 w-4" />
                    <span>Search Prices</span>
                  </SidebarMenuButton>
                </Link>
              </SidebarMenuItem>
            </SidebarMenu>
          </SidebarFooter>
        </>
      )}
    </Sidebar>
  )
}