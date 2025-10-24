"use client";
import React from "react";
import { Card, CardContent} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Search } from "lucide-react";
import { Button } from "@/components/ui/button";
import { MoveRight } from "lucide-react";

export default function SearchPage() {
    function fetchCategories() {
        // fetch categories from backend once setup, dummy data for now
        return [
        {id: 1, name: "Apples",},
        {id: 2, name: "Bananas",},
        {id: 3, name: "Candles",},
        {id: 4, name: "Dog Food",},
        {id: 5, name: "Else",},
        ];
    }
    const categories = fetchCategories();

    return(
        <section>
            <section className="flex flex-row items-center justify-center w-screen h-screen p-10">
                <section className="flex flex-col w-3/5 h-full items-center gap-2">
                    <div className=" w-1/2 flex flex-row items-center bg-white dark:bg-input/30 rounded-md shadow-xs border-1">
                        <Search className="mx-2"/>
                        <Input type="searchbar" placeholder="Search" className="bg-white px-0 border-none"/>
                        <Button className="rounded-l-none bg-primary text-primary-foreground hover:bg-primary/90" onClick={() => {}}>
                         <MoveRight />
                        </Button>
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
            </section>
        </section>
    );
}