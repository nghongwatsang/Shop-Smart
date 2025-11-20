import React from "react";
import { useGlobal } from "@/app/context/GlobalContext";
import { CartItem } from "@/types/CartItem";

export default function QuantityMenu({product}: {product: CartItem}) {
    const {shoppingList, setShoppingList} = useGlobal();

    function changeQuantity(e: React.ChangeEvent<HTMLSelectElement>, product: CartItem) {
        const newQuantity = Number(e.target.value);
        setShoppingList((prev) =>
            prev.map((item) =>
            item.name === product.name && item.brand === product.brand
                ? { ...item, quantity: newQuantity }
                : item
            )
        );
        console.log("Updated shopping list:", shoppingList);
    }

    return (
        <select
            value={product.quantity}
            onChange={(e) => changeQuantity(e, product)}
            size={1} // shows 10 options at a time
            className="border border-gray-300 rounded-md p-1 text-sm focus:outline-none focus:ring-2 focus:ring-blue-400 overflow-auto"
        >
        {[...Array(20)].map((_, i) => (
            <option key={i + 1} value={i + 1}>
            {i + 1}
            </option>
        ))}
        </select>
    );
}