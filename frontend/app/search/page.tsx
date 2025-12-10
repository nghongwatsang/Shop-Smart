"use client";
import React, { useState, useEffect } from "react";
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
    const [categories, setCategories] = useState<string[]>([]);

    function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
        e.preventDefault();
        if (!query.trim()) return; // avoid empty search
        router.push(`/search/${encodeURIComponent(query.trim())}`);
    }

    async function getCategories() {
        return await fetch(`/api/v1/categories`)
        .then(res => res.json());
    }

    useEffect(() => {
        const fetchCategories = async () => {
            const data = await getCategories();
            if (data["errors"]) {
                console.error("Error fetching categories:", data["errors"]);
                return;
            }
            setCategories(data["categories"]);
        }
        fetchCategories();
    }, []);
    
    return(
        <section>
            <GoBackButton router={router} />
            <section className="flex flex-row items-center justify-center w-screen p-10">
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
                    <div className="flex flex-wrap gap-2 w-3/5 justify-center">
                        {categories !== undefined ?
                            categories.map((category, index) => (
                                <Link href={`/search/${category}`} key={index}>
                                    <Card className="w-40 h-20 hover:scale-110 transition-all cursor-pointer bg-gray-50 dark:bg-gray-700 text-sm">
                                        <CardContent className="flex h-full items-center justify-center truncate text-ellipsis">
                                            <div>{category}</div>
                                        </CardContent>
                                    </Card>
                                </Link>
                        )) :
                            <div className="pt-10">No categories found.</div>}
                    </div>
                </section>
            </section>
        </section>
    );
}