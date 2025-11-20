"use client";
import React, { useEffect, useState, useCallback } from "react";
import {
  Accordion,
  AccordionItem,
  AccordionTrigger,
  AccordionContent,
} from "@/components/ui/accordion";
import { useRouter } from "next/navigation";
import GoBackButton from "@/components/back-button";
import { Alert, AlertDescription, AlertTitle } from "@/components/ui/alert";
import { AlertCircle } from "lucide-react";
import { Skeleton } from "@/components/ui/skeleton";
import { useGlobal } from "@/app/context/GlobalContext";
import { CartItem } from "@/types/CartItem";
import { Store } from "@/types/Store";


export default function ResultsPage() {
  const router = useRouter();

  const { shoppingList, activeStores } = useGlobal();

  const [location, setLocation] = useState<{ lat: number; lon: number } | null>(null);
  const [error, setError] = useState<string | null>(null);

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

  async function getDistance(lat1: number, lon1: number, storeName: string) {
    const baseUrl = process.env.NEXT_PUBLIC_API_BASE_URL || 'http://localhost:3003';
    return await fetch(`${baseUrl}/api/v1/route?start_lat=${lat1}&start_lng=${lon1}&store_name=${storeName}`)
    .then(res => res.json());
  }

  async function getResults(shoppingList: CartItem[], activeStores: Store[]) {
    const baseUrl = process.env.NEXT_PUBLIC_API_BASE_URL || 'http://localhost:3003';
    return await fetch(`${baseUrl}/api/v1/results/`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        items: shoppingList,
        allowedStores: activeStores.map(store => store.name)
      })
    }).then(res => res.json());
  }


  const [results, setResults] = useState<Array<{id: number, name: string, distance: string, cost: number, basket: Array<CartItem>}>>([]);
  const [isLoading, setIsLoading] = useState(true);
  
  // Fetch results based on location, shopping list, and active stores
  const fetchResults = useCallback(async () => {

    const listResults = await getResults(shoppingList, activeStores);
    console.log("List Results:", listResults);
    const newResults = [];
    for (const store of activeStores) {

      let distance = "N/A";
      if (location) {
        const data = await getDistance(location.lat, location.lon, store.name);
        distance = data.data.distance_miles + " mi";
      }

      const cost = listResults.results[store.name]?.reduce(
        (acc: number, item: CartItem) => acc + item.price * item.quantity,
        0
      ) ?? -1;
      newResults.push({
        id: store.id,
        name: store.name,
        distance: distance,
        cost,
        basket: listResults.results[store.name] || [],
      });
    }

    return newResults;
  }, [location, shoppingList, activeStores]);


  useEffect(() => {
    const loadResults = async () => {
      try {
        setIsLoading(true);
        const data = await fetchResults();
        setResults(data);
      } catch (err) {
        console.error(err);
      } finally {
        setIsLoading(false);
      }
    };
    loadResults();
  }, [location, fetchResults]);
  // Re-run when location or fetchResults changes
  
  // Loading state
  if (isLoading) {
    return (
      <section className="flex flex-col items-center justify-center h-screen w-screen p-4">
        <div className="w-full max-w-md space-y-4">
          <div className="flex items-center justify-between">
            <Skeleton className="h-8 w-32" />
            <Skeleton className="h-10 w-24" />
          </div>
          {[1, 2, 3].map((i) => (
            <div key={i} className="space-y-2 p-4 border rounded-lg">
              <div className="flex justify-between">
                <Skeleton className="h-6 w-24" />
                <Skeleton className="h-6 w-16" />
                <Skeleton className="h-6 w-12" />
              </div>
              <div className="space-y-2 mt-2">
                <Skeleton className="h-4 w-full" />
                <Skeleton className="h-4 w-3/4" />
              </div>
            </div>
          ))}
        </div>
      </section>
    );
  }

  // Error state
  if (error) {
    return (
      <section className="flex flex-col items-center justify-center h-screen w-screen p-4">
        <div className="w-full max-w-md">
          <Alert variant="destructive">
            <AlertCircle className="h-4 w-4" />
            <AlertTitle>Error</AlertTitle>
            <AlertDescription>
              {error}
            </AlertDescription>
          </Alert>
          <div className="mt-4">
            <GoBackButton router={router} />
          </div>
        </div>
      </section>
    );
  }

  // Results state
  return (
    
    <section className="flex flex-col items-center justify-center min-h-screen w-screen p-4">
      <div className="w-full max-w-md space-y-4">
        <div className="flex items-center justify-between">
          <h1 className="text-lg font-medium text-center w-full">Results for basket:</h1>
          <GoBackButton router={router} />
        </div>

        {shoppingList.length !== 0 ? (
          results.length === 0 ? (
            <div className="text-center py-8 text-muted-foreground">
              No results found. Try adjusting your search.
            </div>
          ) : (
            <Accordion type="multiple" className="space-y-2">
              {[...results]
                .sort((a, b) => {
                  // Primary: basket length DESC
                  if (b.basket.length !== a.basket.length) {
                    return b.basket.length - a.basket.length;
                  }

                  // Secondary: cost ASC
                  return a.cost - b.cost;
                })
                .map((element, index) => (
                <AccordionItem
                  value={String(index)}
                  key={index}
                  className="border rounded-lg shadow-sm bg-card"
                >
                  <AccordionTrigger className="flex flex-row justify-between items-center px-6 py-3 text-lg font-medium">
                    <div className="flex-1 text-left">{element.name}</div>
                    <div className="flex-1 text-center">{element.distance}</div>
                    {element.cost !== -1 ? 
                      <div className="flex-1 text-right">${element.cost}</div> :
                      <div className="flex-1 text-right">N/A</div>
                    }
                  </AccordionTrigger>

                  <AccordionContent className="flex flex-col px-6 pb-3">
                    {element.basket.map((sub_element, sub_index) => (
                      <div
                        className="flex flex-row justify-between py-1 text-sm"
                        key={sub_index}
                      >
                        <div>{sub_element.name}</div>
                        <div>${sub_element.price}</div>
                      </div>
                    ))}
                  </AccordionContent>
                </AccordionItem>
              ))}
            </Accordion>
          )) : (
          <div className="text-center py-8 text-muted-foreground">
            Your shopping cart is empty. Please add items to see results.
          </div>
        )}
        </div>
      </section>
  );
}