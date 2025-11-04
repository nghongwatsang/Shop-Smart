"use client";
import React, { useEffect, useState } from "react";
import { useGlobal } from "../context/GlobalContext";
import {
  Accordion,
  AccordionItem,
  AccordionTrigger,
  AccordionContent,
} from "@/components/ui/accordion";
import { useRouter } from "next/navigation";
import GoBackButton from "@/components/back-button";

export default function ResultsPage() {
  const { shoppingList } = useGlobal();
  const router = useRouter();

  const [location, setLocation] = useState<{ lat: number; lon: number } | null>(null);
  const [error, setError] = useState<string | null>(null);

  // 🧭 Ask for location on mount
  useEffect(() => {
    if (!navigator.geolocation) {
      setError("Geolocation is not supported by your browser.");
      return;
    }

    navigator.geolocation.getCurrentPosition(
      (pos) => {
        setLocation({ lat: pos.coords.latitude, lon: pos.coords.longitude });
      },
      (err) => {
        if (err.code === err.PERMISSION_DENIED) setError("Location access denied.");
        else setError("Unable to retrieve location.");
      }
    );
  }, []);

  async function getDistance(lat1: number, lon1: number, lat2: number, lon2: number){
    const baseUrl = process.env.NEXT_PUBLIC_API_BASE_URL || 'http://localhost:3003';
    return await fetch(`${baseUrl}/api/v1/route?start_lat=${lat1}&start_lng=${lon1}&end_lat=${lat2}&end_lng=${lon2}`)
    .then(res => res.json());
  }

  async function fetchResults() {

    const stores = 
    [
      {
        name: "Walmart",
        latitude: 42.7457318,
        longitude: -73.6387872,
      },
      {
        name: "Hannaford",
        latitude: 42.7438908,
        longitude: -73.6519795,
      },
      {
        name: "Market32",
        latitude: 42.7421706,
        longitude: -73.643382,
      }
    ]

    let results = [
      {
        id: 1,
        name: "Walmart",
        distance: "N/A",
        cost: 1,
        basket: [{ item: "Sample Item", cost: 1 }],
      },
      {
        id: 2,
        name: "Hannaford",
        distance: "N/A",
        cost: 2,
        basket: [{ item: "Sample Item", cost: 2 }],
      },
      {
        id: 3,
        name: "Market32",
        distance: "N/A",
        cost: 3,
        basket: [{ item: "Sample Item", cost: 3 }],
      },
    ];
    if (!location){
      return results;
    }
    for (let i = 0; i < stores.length; i++) {
      const store = stores[i];
      const distance = await getDistance(location.lat, location.lon, store.latitude, store.longitude);
      console.log(distance);
      results[i].distance = distance.data.distance_miles + " mi";
    }

    return results
  }

  const [results, setResults] = useState<Array<{id: number, name: string, distance: string, cost: number, basket: Array<{item: string, cost: number}>}>>([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const loadResults = async () => {
      try {
        const data = await fetchResults();
        setResults(data);
      } catch (error) {
        console.error('Error fetching results:', error);
      } finally {
        setIsLoading(false);
      }
    };

    loadResults();
  }, [location]); // Re-run when location changes
  
  return (
    <section className="flex flex-col items-center justify-center h-screen w-screen pt-24">
      <div className="flex flex-col items-center w-full">
        {/* Go Back Button */}
        <GoBackButton router={router} />

        <div className="p-5 text-lg font-medium">Results for basket:</div>

        {/* Accordion */}
        <Accordion
          type="multiple"
          defaultValue={results.map((_, index) => String(index))}
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
      </div>
    </section>
  );
}