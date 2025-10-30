import React from "react";
import { useGlobal } from "@/app/context/GlobalContext";

type QuantityMenuProps = {
  product: { item: string; imgSrc: string; quantity: number }
  removeItem: (product: { item: string; imgSrc: string; quantity: number }) => void;
};

export default function QuantityMenu({product, removeItem}: QuantityMenuProps) {
    const {shoppingList, setShoppingList} = useGlobal();

    return (
        <select
        value={product.quantity}
        onChange={(e) => {
            const newQuantity = Number(e.target.value);
            setShoppingList((prev) =>
                prev.map((item) =>
                item.item === product.item && item.imgSrc === product.imgSrc
                    ? { ...item, quantity: newQuantity }
                    : item
                )
            );
            console.log(shoppingList)
        }}
        className="border border-gray-300 rounded-md p-1 text-sm focus:outline-none focus:ring-2 focus:ring-blue-400"
        >
            {[...Array(10)].map((_, i) => (
                <option key={i + 1} value={i + 1}>
                {i + 1}
                </option>
            ))}
        </select>
    );
}