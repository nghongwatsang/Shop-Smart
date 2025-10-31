"use client";
import React, { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { useSidebar } from "@/components/ui/sidebar";
import { setSourceMapsEnabled } from "process";

export default function Home() {

  const [stores, setStores] = useState<Number[]>([]);
  const { setOpen } = useSidebar()

  function changeStore(category: {id: number, logo_path: string}) {
    if (stores.includes(category.id)) {
      setStores(stores.filter(id => id !== category.id));
    } else {
      setStores([...stores, category.id])
    }
  }
  
  const categories = [
    {id: 1, logo_path: "/WalmartLogo.png"},
    {id: 2, logo_path: "/hannafords.svg"},
    {id: 3, logo_path: "/Market_32.png"},
  ];
  
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
            {categories.map((category) => (
              <div key={category.id} className="px-10">
                <Card className={`w-30 h-30 bg-gray-50 dark:bg-gray-700 hover:scale-110 transition-all cursor-pointer ${!stores.includes(category.id) ? 'saturate-0 brightness-85' : ''}`} onClick={() => changeStore(category)}>
                  <CardContent className="w-30 h-30 flex items-center justify-center">
                    <Image src={category.logo_path} alt="Logo" width={100} height={100} />
                  </CardContent>
                </Card>
              </div>
            ))}
          </div>
        </Card>
      </div>

      {stores.length > 0 && 
        <div className="pt-10">
          <Link href="/search">
            <Button onClick={() => setOpen(true)}>Start Saving!</Button>
          </Link>
        </div>
      }
    </div>
  );
}