"use client";
import { createContext, useContext, useState, ReactNode, useEffect } from "react";
import { CartItem } from "@/types/CartItem";
import { Store } from "@/types/Store";

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
  const [stores, setStores] = useState<Store[]>([]); 
  const [activeStores, setActiveStores] = useState<Store[]>([]);

  // Load saved data on mount
  useEffect(() => {
    const savedList = localStorage.getItem("shoppingList");
    const savedStores = localStorage.getItem("stores");

    if (savedList) {
      setShoppingList(JSON.parse(savedList));
    }

    if (savedStores) {
      setStores(JSON.parse(savedStores));
    } else {
      // Default stores (if nothing is saved yet)
      setStores([
        { id: 1, name: "Aldi", logo_path: "/Aldi-logo.png", active: false },
        { id: 2, name: "Hannaford", logo_path: "/hannafords.svg", active: false },
        { id: 3, name: "Price Chopper", logo_path: "/market32.png", active: false },
      ]);
    }
  }, []);

  // Save shoppingList persistently
  useEffect(() => {
    localStorage.setItem("shoppingList", JSON.stringify(shoppingList));
  }, [shoppingList]);

  // Save stores persistently
  useEffect(() => {
    localStorage.setItem("stores", JSON.stringify(stores));
  }, [stores]);

  // Update active stores when store activity changes
  useEffect(() => {
    setActiveStores(stores.filter((store) => store.active));
  }, [stores]);

  function changeStore(store: Store) {
    setStores((prev) =>
      prev.map((item) =>
        item.id === store.id ? { ...item, active: !item.active } : item
      )
    );
  }

  return (
    <GlobalContext.Provider
      value={{
        shoppingList,
        setShoppingList,
        stores,
        setStores,
        activeStores,
        setActiveStores,
        changeStore,
      }}
    >
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
