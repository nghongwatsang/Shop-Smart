"use client";
import { createContext, useContext, useState, ReactNode, useEffect } from "react";

type GlobalContextType = {
  shoppingList: CartItem[];
  stores: Store[];
  activeStores: Store[];
  setShoppingList: React.Dispatch<React.SetStateAction<CartItem[]>>;
  setStores: React.Dispatch<React.SetStateAction<Store[]>>;
  setActiveStores: React.Dispatch<React.SetStateAction<Store[]>>;
  changeStore: (store: Store) => void;
};

const GlobalContext = createContext<GlobalContextType | undefined>(undefined);

export function GlobalProvider({ children }: { children: ReactNode }) {
  const [shoppingList, setShoppingList] = useState<CartItem[]>([]);

  {/*Should maybe make a fetch to the backend for this incase of db changes*/}
  const [stores, setStores] = useState<Store[]>([
    {id: 1, name: "Aldi",logo_path: "/Aldi-logo.png", active: false},
    {id: 2, name: "Hannafords", logo_path: "/hannafords.svg", active: false},
    {id: 3, name: "Target",logo_path: "/target.png", active: false},
  ]);
  
  const [activeStores, setActiveStores] = useState<Store[]>([]);

  useEffect(() => {
    setActiveStores(stores.filter((store) => store.active));
  }, [stores]);

  function changeStore(store: Store) {
    const newActivity = store.active ? false : true;
    setStores((prev) =>
      prev.map((item) =>
        item.id === store.id ? { ...item, active: newActivity } : item
      )
    );
  }

  return (
    <GlobalContext.Provider value={{ shoppingList, setShoppingList, stores, setStores, activeStores, setActiveStores, changeStore }}>
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