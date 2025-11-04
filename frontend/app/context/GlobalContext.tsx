"use client";
import { createContext, useContext, useState, ReactNode } from "react";

type Product = {
  item: string;
  imgSrc: string;
  quantity: number;
};

type GlobalContextType = {
  shoppingList: Product[];
  setShoppingList: React.Dispatch<React.SetStateAction<Product[]>>;
};

const GlobalContext = createContext<GlobalContextType | undefined>(undefined);

export function GlobalProvider({ children }: { children: ReactNode }) {
  const [shoppingList, setShoppingList] = useState<Product[]>([]);

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