"use client";
import React from "react";
import { Card, CardContent} from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import LogoLink from "@/components/LogoLink";
import CartMenu from "@/components/CartMenu";

export default function SearchPage() {
    function fetchCategories() {
        // fetch categories from backend once setup, dummy data for now
        return [
        {
            id: 1,
            name: "Apples!",
        },
        {
            id: 2,
            name: "Bananas",
        },
        {
            id: 3,
            name: "Candles",
        },
        {
            id: 4,
            name: "Dog Food",
        },
        {
            id: 5,
            name: "Else",
        },
        ];
    }

    const categories = fetchCategories();

    return(
        <section className="flex flex-row justify-center w-screen h-screen p-10">
            <section className="w-1/5">
                <LogoLink />
            </section>
            <section className="flex flex-col w-3/5 h-full items-center bg-green-700">
                <div className="pb-2 w-1/2">
                    <Input type="searchbar" placeholder="Search" className="bg-white"/>
                </div>
                <div className="flex flex-wrap gap-2 w-1/2 justify-center">
                    {categories.map((category) => (
                        <Card className="w-30 h-30 hover:scale-110 transition-all cursor-pointer" key={category.id}>
                            <CardContent className="w-30 h-30 flex items-center justify-center">
                                <div>{category.name}</div>
                            </CardContent>
                        </Card>
                    ))}
                </div>
            </section>
            <section className="w-1/5 justify-end"><CartMenu /></section>
        </section>
    );
}