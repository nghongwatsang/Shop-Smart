"use client";
import React from "react";
import Image from "next/image";
import Link from "next/link";
import { Card, CardHeader, CardTitle, CardDescription, CardContent, CardFooter } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

export default function Home() {
  
  const categories = [
    {
      id: 1,
      logo_path: "/WalmartLogo.png",
    },
    {
      id: 2,
      logo_path: "/hannafords.svg",
    },
    {
      id: 3,
      logo_path: "/Market_32.png",
    },
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
        {categories.map((category) => (
          <div key={category.id} className="px-10">
            <Card className="w-30 h-30 hover:scale-110 transition-all cursor-pointer" onClick={() => console.log(category.id)}>
              <CardContent className="w-30 h-30 flex items-center justify-center">
                <Image src={category.logo_path} alt="Logo" width={100} height={100} />
              </CardContent>
            </Card>
          </div>
      ))}
      </div>

      <div className="pt-10">
        <Link href="/search">
          <Button>Start Saving!</Button>
        </Link>
      </div>
    </div>
  );
}