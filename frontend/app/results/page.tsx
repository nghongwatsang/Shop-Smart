"use client";
import React from "react";
import { useGlobal } from "../context/GlobalContext";
import {
  Accordion,
  AccordionItem,
  AccordionTrigger,
  AccordionContent,
} from "@/components/ui/accordion";
import {useRouter} from "next/navigation";
import { ArrowLeft } from "lucide-react";
import GoBackButton from "@/components/back-button";

export default function ResultsPage() {
  const { shoppingList } = useGlobal();
  const router = useRouter();
  function fetchResults() {
    // fetch results from backend using the shoppingList
    return [
      {
        id: 1,
        name: "Walmart",
        distance: "2.1mi",
        cost: 1,
        basket: [{ item: "Sample Item", cost: 1 }],
      },
      {
        id: 2,
        name: "Hannaford",
        distance: "1.5mi",
        cost: 2,
        basket: [{ item: "Sample Item", cost: 2 }],
      },
      {
        id: 3,
        name: "Market32",
        distance: "2.6mi",
        cost: 3,
        basket: [{ item: "Sample Item", cost: 3 }],
      },
    ];
  }

  const results = fetchResults();

  return (
    <section className="flex flex-col items-center justify-center h-screen w-screen">
      <div className="p-5 text-lg font-medium">Results for basket:</div>
      {/* Go Back Button */}
      <GoBackButton router={router} />

        {/* Accordion */}
        <Accordion
          type="multiple"
          className="w-full max-w-md flex flex-col space-y-2"
        >
          {results.map((element, index) => (
            <AccordionItem
              value={String(index)}
              key={index}
              className="border rounded-lg shadow-sm bg-gray-50 dark:bg-gray-800"
            >
              <AccordionTrigger className="flex flex-row justify-between items-center px-6 py-3 text-lg font-medium text-center">
                <div className="flex-1 text-left">{element.name}</div>
                <div className="flex-1 text-center">{element.distance}</div>
                <div className="flex-1 text-right">${element.cost}</div>
              </AccordionTrigger>

              <AccordionContent className="flex flex-col px-6 pb-3">
                {element.basket.map((sub_element, sub_index) => (
                  <div
                    className="flex flex-row justify-between py-1 text-sm"
                    key={sub_index}
                  >
                    <div>{sub_element.item}</div>
                    <div>${sub_element.cost}</div>
                  </div>
                ))}
              </AccordionContent>
            </AccordionItem>
          ))}
        </Accordion>
    </section>
  );
}