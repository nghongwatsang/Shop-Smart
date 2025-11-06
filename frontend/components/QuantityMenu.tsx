import React from "react";
import { useGlobal } from "@/app/context/GlobalContext";

type QuantityMenuProps = {
  product: { item: string; imgSrc: string; quantity: number }
};

export default function QuantityMenu({product}: QuantityMenuProps) {
    const {shoppingList, setShoppingList} = useGlobal();

    function changeQuantity(e: React.ChangeEvent<HTMLSelectElement>, product: Product) {
        const newQuantity = Number(e.target.value);
        setShoppingList((prev) =>
            prev.map((item) =>
            item.item === product.item && item.imgSrc === product.imgSrc
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