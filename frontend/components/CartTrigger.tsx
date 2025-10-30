"use client";

import { useGlobal } from "@/app/context/GlobalContext";
import { SidebarTrigger } from "@/components/ui/sidebar";

export function CartTrigger() {
  const { shoppingList } = useGlobal();

  return (
    <div className="relative">
      <SidebarTrigger className="fixed right-8 top-8 z-[9999]" />
      {/* 
      Did we need this functionality?
    
      {shoppingList.length > 0 && (
        <span className="absolute right-4 top-4 bg-red-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">
          {shoppingList.length}
        </span>
      )} */} 
      
    </div>
  );
}
