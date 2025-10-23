"use client";
import React from "react";
import { useGlobal } from '../context/GlobalContext';
import { Accordion, AccordionItem, AccordionTrigger, AccordionContent } from "@/components/ui/accordion";

export default function ResultsPage() {
    const { shoppingList } = useGlobal();

    function fetchResults() {
        // fetch results from backend using the shoppingList
        return [
        {id: 1, name: "Walmart", distance: "2.1mi", cost: 1, basket: [{item: "Sample Item", cost: 1}]},
        {id: 2, name: "Hannaford", distance: "1.5mi", cost: 2, basket: [{item: "Sample Item", cost: 2}]},
        {id: 3, name: "Market32", distance: "2.6mi", cost: 3, basket: [{item: "Sample Item", cost: 3}]},
        ];
    }
    const results = fetchResults();

    return (
        <section>
            <Accordion type="single" collapsible className="w-full flex flex-col h-screen items-center justify-center" >
                {results.map((element, index) => (
                    <AccordionItem value={String(index)} className="">
                        <AccordionTrigger className="flex flex-row justify-center">
                            <div>{element.name}</div>
                            <div>{element.distance}</div>
                            <div>{element.cost}</div>
                        </AccordionTrigger>
                        <AccordionContent className="flex flex-col">
                            {element.basket.map((sub_element, sub_index) => (
                                <div className="flex flex-row justify-between" key={sub_index}>
                                    <div>{sub_element.item}</div>
                                    <div>{sub_element.cost}</div>
                                </div>
                            ))}
                        </AccordionContent>
                    </AccordionItem>
                ))}
            </Accordion>
        </section>
    )
}