import React, { useState } from 'react';
import Image from 'next/image';

// Cart extension feature, not finished yet

export default function CartMenu() {
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
                <div>
                    <div className={`flex flex-col fixed right-0 w-1/5 shadow-xl transition duration-2000 ease-in-out ${visible ? "right-0" : "right-36"}`}>
                        <button className="bg-green-100 p-1"> Cart </button>
                        <button className="bg-green-100 p-1"> Cart </button>
                        <button className="bg-green-100 p-1"> Cart </button>
                        <button className="bg-green-100 p-1"> Cart </button>
                        <button className="p-1"> Cart </button>
                    </div>
                </div>
                </>
            )}
        </div>
    );
 }