"use client";
import React, { useState } from "react";
import Link from "next/link";
import { Card, CardContent} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Search } from "lucide-react";
import { Button } from "@/components/ui/button";
import { MoveRight } from "lucide-react";
import GoBackButton from "@/components/back-button";

import { useRouter } from "next/navigation";

export default function SearchPage() {
    const router = useRouter();
    const [query, setQuery] = useState("");

    function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
        console.log("Test")
        e.preventDefault();
        if (!query.trim()) return; // avoid empty search
        router.push(`/search/${encodeURIComponent(query.trim())}`);
    }

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
            <GoBackButton router={router} />
            <section className="flex flex-row items-center justify-center w-screen h-screen p-10">
                <section className="flex flex-col w-3/5 h-full items-center gap-2">
                    <form
                        onSubmit={handleSubmit}
                        className="w-1/2 flex flex-row items-center bg-white dark:bg-input/30 rounded-md shadow-xs border-1"
                        >
                        <Search className="mx-2" />
                        <Input
                            type="search"
                            placeholder="Search"
                            className="bg-white px-0 border-none focus-visible:ring-0 focus-visible:outline-none"
                            value={query}
                            onChange={(e) => setQuery(e.target.value)}
                        />
                        <Button
                            type="submit"
                            className="rounded-l-none bg-primary text-primary-foreground hover:bg-primary/90"
                        >
                            <MoveRight />
                        </Button>
                    </form>
                    <div className="flex flex-wrap gap-2 w-1/2 justify-center">
                        {categories.map((category) => (
                            <Link href={`/search/${category.name}`} key={category.id}>
                                <Card className="w-30 h-10 hover:scale-110 transition-all cursor-pointer bg-gray-50 dark:bg-gray-700">
                                    <CardContent className="flex h-full items-center justify-center">
                                        <div>{category.name}</div>
                                    </CardContent>
                                </Card>
                            </Link>
                        ))}
                    </div>
                </section>
            </section>
        </section>
    );
}