"use client";
import { createContext, useContext, useState, ReactNode } from "react";

type GlobalContextType = {
  shoppingList: { item: string; imgSrc: string; }[];
  setShoppingList: (list: { item: string; imgSrc: string; }[]) => void;
};

const GlobalContext = createContext<GlobalContextType | undefined>(undefined);

export function GlobalProvider({ children }: { children: ReactNode }) {
  const [shoppingList, setShoppingList] = useState<{ item: string; imgSrc: string; }[]>([]);

  return (
    <GlobalContext.Provider value={{ shoppingList, setShoppingList }}>
      {children}
    </GlobalContext.Provider>
  );
}

export function useGlobal() {
  const context = useContext(GlobalContext);
  if (!context) {
    throw new Error("useGlobal must be used within a GlobalProvider");
  }
  return context;
}