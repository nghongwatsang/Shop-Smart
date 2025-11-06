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
import { Trash2, Banknote } from "lucide-react"
import QuantityMenu from "@/components/QuantityMenu"

export function AppSidebar() {
  const { shoppingList, setShoppingList } = useGlobal()

  function removeItem(product: CartItem) {
    setShoppingList((prevList) =>
      prevList.filter(
        (item) => item.name !== product.name || item.brand !== product.brand
      )
    );
  }

  return (
    <Sidebar side="right"
      className="fixed top-0 right-0 h-screen w-[20rem] z-[9998] shadow-lg bg-background transition-transform duration-300"
    >
      <SidebarHeader>
        <div className="px-2 py-2">
          <h2 className="text-lg font-semibold">Shopping Cart</h2>
          <p className="text-sm text-muted-foreground">
            {shoppingList.length} {shoppingList.length === 1 ? 'product' : 'products'}
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
                {[...shoppingList].sort((a, b) =>
                  a.name.localeCompare(b.name)
                ).map((item, index) => (
                  <SidebarMenuItem
                    key={index}
                    className="w-full flex flex-row justify-between items-center hover:bg-gray-200 dark:hover:bg-gray-700"
                  >
                    {/* Left side: image + name */}
                    <div className="flex items-center gap-2 flex-1">
                      <span className="pl-1 truncate">{item.name}</span>
                    </div>

                    {/* Right side: quantity + delete button */}
                    <div className="flex items-center gap-2 ml-auto">
                      <QuantityMenu product={item} />
                      <button
                        className="pl-3 hover:scale-110 hover:brightness-90 cursor-pointer"
                        onClick={() => removeItem(item)}
                      >
                        <Image src="/stop-transparent.png" alt="Delete" width={30} height={30} />
                      </button>
                    </div>
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
                  className="w-full text-destructive hover:text-destructive cursor-pointer"
                >
                  <Trash2 className="h-4 w-4" />
                  <span>Clear Cart</span>
                </SidebarMenuButton>
              </SidebarMenuItem>
              <SidebarMenuItem>
                <Link href="/results" className="w-full">
                  <SidebarMenuButton className="w-full cursor-pointer text-green-700 dark:text-">
                    <Banknote className="h-4 w-4" />
                    <span>Calculate Savings</span>
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