"use client";
import React, { useState } from "react";
import { Card, CardContent} from "@/components/ui/card";
import Image from "next/image";
import GoBackButton from "@/components/back-button";
import { useRouter } from "next/navigation";
import { Input } from "@/components/ui/input";
import { Search } from "lucide-react";
import { Button } from "@/components/ui/button";
import { MoveRight } from "lucide-react";
import { useGlobal } from "@/app/context/GlobalContext";

interface ProductPageProps {
  params: Promise<{ query: string }>;
}

export default function ProductPage({ params }: ProductPageProps) {
    const { query } = React.use(params); 
    const router = useRouter();
    const [newQuery, setNewQuery] = useState("");

    const {shoppingList, setShoppingList} = useGlobal();

    {/* Search field submit router*/}
    function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
        e.preventDefault();
        if (!newQuery.trim()) return; // avoid empty search
        router.push(`/search/${encodeURIComponent(newQuery.trim())}`);
    }

    {/* Add to cart function */}
    function changeCart (product: {itemName: string, brandName: string, lowestPrice: number, imgSrc: string, source: string}) {
        return () => {
            const exists = shoppingList.find(item => item.item === product.itemName && item.imgSrc === product.imgSrc);
            if (!exists) {
                setShoppingList([...shoppingList, {item: product.itemName, imgSrc: product.imgSrc, quantity:1}]);
            } else {
                setShoppingList(shoppingList.filter(item => !(item.item === product.itemName && item.imgSrc === product.imgSrc)));
            }
        }
    }




    {/*img, itemname, brandname, lowest_price, source*/}
    function fetchQueryResults () {
        return query == "Apples" ? 
        [
            {imgSrc:"/file.svg", itemName:"Granny Smith Apples", brandName:"Generic", lowestPrice:1.09, source:'hannaford'},
            {imgSrc:"/file.svg", itemName:"Honeycrisp Apples", brandName:"BigApple", lowestPrice:1.89, source:'hannaford'},
            {imgSrc:"/file.svg", itemName:"iPhone 17 Pro Max", brandName:"Apple", lowestPrice:1500, source:'hannaford'}
        ]
        :
        false;
    }
    const results = fetchQueryResults();

    const stores = [
        {name: "walmart", logo_path: "/WalmartLogo.png"},
        {name: "hannaford", logo_path: "/hannafords.svg"},
        {name: "market32", logo_path: "/Market_32.png"}
    ]

    function inCart (product: {itemName: string, imgSrc: string}) {
        return shoppingList.find(item => item.item === product.itemName && item.imgSrc === product.imgSrc) ? 'bg-green-400 dark:bg-green-700' : '';
    }

    return (
        <section className="flex flex-col items-center justify-center w-screen p-10">
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

            <div className="pt-10 pb-4 w-3/10 flex items-center justify-center">
                <Card className="flex items-center justify-center w-full bg-white dark:bg-gray-400">
                    <CardContent className="font-medium">Results:</CardContent>
                </Card>
            </div>

            {/* Results */}
            {results &&
                results.map((result,index) =>
                    <div className="pt-1 w-3/5" key={index}>
                        <Card className={`flex items-center justify-center w-full bg-gray-100 dark:bg-gray-700 hover:brightness-90 ${inCart(result)}`} onClick={changeCart(result)}>
                            <section className="flex flex-row items-center justify-between w-full cursor-pointer">
                                <CardContent className="w-1/4 text-center"><Image src={`${result.imgSrc}`} alt={"Img"} width={10} height={10}/></CardContent>
                                <CardContent className="w-1/4 text-center">{result.itemName}</CardContent>
                                <CardContent className="w-1/4 text-center italic">{result.brandName}</CardContent>
                                <CardContent className="w-1/4 text-center">${result.lowestPrice}</CardContent>
                            </section>
                        </Card>
                    </div>
                )
            }

            {!results &&
                <div className="pt-10 font-medium text-large">No results found</div>
            }
        </section>
    );
}