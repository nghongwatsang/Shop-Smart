"use client";

import { useGlobal } from "@/app/context/GlobalContext";
import { SidebarTrigger } from "@/components/ui/sidebar";

export function CartTrigger() {
  const { shoppingList } = useGlobal();

  return (
    <div className="relative">
      <div className="fixed right-7 top-7 z-[10000] w-4 h-4 rounded-full bg-green-700 text-white flex text-center items-center justify-center">{shoppingList.length}</div>
      <SidebarTrigger className="fixed right-8 top-8 z-[9999] cursor-pointer" />
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
