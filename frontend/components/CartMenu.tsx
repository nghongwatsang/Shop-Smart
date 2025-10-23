import React, { useState } from 'react';
import Image from 'next/image';
import Link from "next/link";
import { useGlobal } from '../app/context/GlobalContext';

// Cart extension feature, not finished yet

export default function CartMenu() {
    const { shoppingList, setShoppingList } = useGlobal();
    const [visible, setVisible] = useState(false);

    return (
        <div className="flex flex-col items-end fixed top-0 right-0 p-10 z-50">
            <button className="rounded-4xl transition bg-green-200 duration-175 hover:brightness-85" onClick={() => setVisible(!visible)}>
                {!visible && <Image src="/CART-transparent.png" alt="Cart" width={100} height={100} className="p-3"/>}
                {visible && <Image src="/stop-transparent.png" alt="Stop" width={100} height={100}/>}
            </button>
            {visible && (
                // Needs work here, maybe use Sidebar object from Shadcn
                <>
                <div className={`w-full flex flex-col not-last-of-type:shadow-xl transition duration-2000 ease-in-out bg-green-100 ${visible ? "right-0" : "right-36"}`}>
                    <div className="flex flex-col p-2">
                        {/* Render Elements of shoppingList, not certain whats gonna be in it yet or our plan for formatting so ill wait*/}
                        {shoppingList.map((element, index) => (
                            <div key={index} className="flex flex-row items-center p-2 m-2 border-b-2 border-green-300">
                                <Image src={element.imgSrc} alt={element.item} width={5} height={5} className="mr-2"/>
                                <div>{element.item}</div>
                            </div>
                        ))}
                    </div>
                    
                    <button className="bg-blue-300 p-2 m-2 rounded-2xl hover:brightness-90 transition text-center" onClick={() => setShoppingList([])}>Reset Cart</button>
                    <Link href="/results" className="flex items-center justify-center">
                        <button className="bg-green-300 p-2 m-2 rounded-2xl hover:brightness-90 transition items-center justify-center"> Search! </button>
                    </Link>
                </div>
                </>
            )}
        </div>
    );
 }