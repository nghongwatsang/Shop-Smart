"use client";
import { createContext, useContext, useState, ReactNode } from "react";

type GlobalContextType = {
  shoppingList: CartItem[];
  setShoppingList: React.Dispatch<React.SetStateAction<CartItem[]>>;
  stores: Store[];
  setStores: React.Dispatch<React.SetStateAction<Store[]>>;
};

const GlobalContext = createContext<GlobalContextType | undefined>(undefined);

export function GlobalProvider({ children }: { children: ReactNode }) {
  const [shoppingList, setShoppingList] = useState<CartItem[]>([]);
  const [stores, setStores] = useState<Store[]>([
    {id: 1, name: "Aldi",logo_path: "/Aldi-logo.png", active: false},
    {id: 2, name: "Hannafords", logo_path: "/hannafords.svg", active: false},
    {id: 3, name: "Target",logo_path: "/target.png", active: false},
  ]);

  return (
    <GlobalContext.Provider value={{ shoppingList, setShoppingList, stores, setStores }}>
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