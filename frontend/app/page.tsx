"use client";
import React, { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { useSidebar } from "@/components/ui/sidebar";
import { useGlobal } from "./context/GlobalContext";
import { Check } from "lucide-react";

export default function Home() {

  const {stores, setStores} = useGlobal();
  const { setOpen } = useSidebar()

  function changeStore(store: Store) {
    const newActivity = store.active ? false : true;
    setStores((prev) =>
      prev.map((item) =>
        item.id === store.id ? { ...item, active: newActivity } : item
      )
    );
  }

  function activeStores() {
    return stores.filter((store) => store.active);
  }
  
  return(
    <div className="flex flex-col w-screen h-screen items-center justify-center p-10">
      
      <div className="flex flex-col items-center pb-10">
        
        <div>
          <Image src="/LOGO-transparent.png" alt="Logo" width={300} height={300} />
        </div>

        <div className="text-2xl font-bold text-green-700">
          We think you save
        </div>
      </div>

      <div className="flex flex-row items-center">
        <Card className="flex flex-col items-center justify-center p-5 gap-5 font-medium">
          Select preferred stores:
          <div className="flex flex-row items-center justify-center">
            {stores.map((store: Store) => (
              <div key={store.id} className="px-10">
                <Card className={`relative w-30 h-30 bg-gray-50 dark:bg-gray-700 hover:scale-110 transition-all cursor-pointer ${!activeStores().includes(store) ? 'saturate-0 brightness-85' : ''}`} onClick={() => changeStore(store)}>
                  <CardContent className="w-30 h-30 flex items-center justify-center">
                    {activeStores().includes(store) && (
                      <Check className="absolute top-2 right-2 w-6 h-6 text-green-500 z-[10]" />
                    )}
                    <Image src={store.logo_path} alt="Logo" width={100} height={100} />
                  </CardContent>
                </Card>
              </div>
            ))}
          </div>
        </Card>
      </div>

      {activeStores().length > 0 && 
        <div className="pt-10">
          <Link href="/search">
            <Button onClick={() => setOpen(true)}>Start Saving!</Button>
          </Link>
        </div>
      }

      {activeStores().length == 0 && 
        <div className="pt-10">
          <Button className="bg-gray-500" variant={"ghost"}>Start Saving!</Button>
        </div>
      }
    </div>
  );
}