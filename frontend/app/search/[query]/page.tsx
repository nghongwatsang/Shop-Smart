"use client";
import React, { useState, useEffect } from "react";
import { Card, CardContent} from "@/components/ui/card";
import Image from "next/image";
import GoBackButton from "@/components/back-button";
import { useRouter } from "next/navigation";
import { Input } from "@/components/ui/input";
import { Search } from "lucide-react";
import { Button } from "@/components/ui/button";
import { MoveRight } from "lucide-react";
import { useGlobal } from "@/app/context/GlobalContext";
import { Product } from "@/types/Product";

interface ProductPageProps {
  params: Promise<{ query: string }>;
}

export default function ProductPage({ params }: ProductPageProps) {
    const { query } = React.use(params);
    const { stores } = useGlobal(); 
    const router = useRouter();
    const [newQuery, setNewQuery] = useState("");
    const [results, setResults] = useState<Product[]>([]);
    const [loading, setLoading] = useState(true);

    const {shoppingList, setShoppingList} = useGlobal();

    {/* Search field submit router*/}
    function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
        e.preventDefault();
        if (!newQuery.trim()) return;
        router.push(`/search/${encodeURIComponent(newQuery.trim())}`);
    }

    {/* Add to cart function */}
    function changeCart (product: Product) {
        return () => {
            const exists = shoppingList.find(item => item.name === product.name && item.brand === product.brand);
            if (!exists) {
                setShoppingList([...shoppingList, {name: product.name, brand: product.brand, store: product.store, size: product.size, unit: product.unit, price: product.price, quantity:1}]);
            } else {
                setShoppingList(shoppingList.filter(item => !(item.name === product.name && item.brand === product.brand)));
            }
        }
    }

    {/*img, itemname, brandname, lowest_price, source*/}
    useEffect(() => {
        async function getResults() {
            setLoading(true);
            try {
                const baseUrl = process.env.NEXT_PUBLIC_API_BASE_URL || 'http://localhost:3003';
                const res = await fetch(`${baseUrl}/api/v1/search?query=${query}`);
                console.log(res);
                if (!res.ok) {
                    console.error("Error fetching query results:", res.statusText);
                    setResults([]);
                    return;
                }

                const data = await res.json();
                setResults(data.items.length > 0 ? data.items : []);
            } catch (error) {
                console.error("Error fetching query results:", error);
                setResults([]);
            }
            setLoading(false);
        }
        getResults();
    }, [query, results]);

    function inCart (product: {name: string, brand: string}) {
        return shoppingList.find(item => item.name === product.name && item.brand === product.brand) ? 'bg-green-400 dark:bg-green-700' : '';
    }

    function getImage(store: string) {
        const foundStore = stores.find(s => s.name === store);
        return foundStore ? <Image src={foundStore.logo_path} alt={store} width={50} height={50} /> : null;
    }

    return (
        <section className="flex flex-col items-center w-screen p-10">
            <GoBackButton router={router} />

            {/* Search Bar */}
            <form
                onSubmit={handleSubmit}
                className="w-3/10 flex flex-row items-center bg-white dark:bg-input/30 rounded-md shadow-xs border-1"
                >
                <Search className="mx-2" />
                <Input
                    type="search"
                    placeholder="Search"
                    className="bg-white px-0 border-none focus-visible:ring-0 focus-visible:outline-none"
                    value={newQuery}
                    onChange={(e) => setNewQuery(e.target.value)}
                />
                <Button
                    type="submit"
                    className="rounded-l-none bg-primary text-primary-foreground cursor-pointer hover:bg-primary/90"
                >
                    <MoveRight />
                </Button>
            </form>

            <div className="pt-14 pb-9 w-3/5 flex items-center justify-center">
                <div className="flex flex-col items-center justify-center w-full">
                    <h1 className="text-xl font-bold pb-6">Results:</h1>
                    <div className="font-semibold flex flex-row justify-between w-full">
                        <div className="w-1/4 text-center text-lg">Name(Size)</div>
                        <div className="w-1/4 text-center text-lg">Brand</div>
                        <div className="w-1/4 text-center text-lg">Cheapest Store</div>
                        <div className="w-1/4 text-center text-lg">Cheapest Price</div>
                    </div>
                </div>
            </div>

            {/* Results */}
            {!loading ?
                results.length > 0 ? (
                    results.map((result: Product,index) =>
                        <div className="pt-1 w-3/5" key={index}>
                            <Card className={`flex items-center justify-center w-full bg-gray-100 dark:bg-gray-700 hover:brightness-90 ${inCart(result)}`} onClick={changeCart(result)}>
                                <section className="flex flex-row items-center justify-between w-full cursor-pointer">
                                    <CardContent className="w-1/4 text-center">{result.name} ({result.size}{result.unit})</CardContent>
                                    <CardContent className="w-1/4 text-center italic">{result.brand}</CardContent>
                                    <CardContent className="w-1/4 flex justify-center items-center">{getImage(result.store)}</CardContent>
                                    <CardContent className="w-1/4 text-center">${result.price}</CardContent>
                                </section>
                            </Card>
                        </div>
                    )) : (
                    <div className="pt-10 font-medium text-large text-muted-foreground">No results found</div>
                )
            : 
                <div className="pt-10 font-medium text-large text-muted-foreground">Loading...</div>
            }
        </section>
    );
}