import React, { useState } from 'react';
import Image from 'next/image';

export default function CartMenu() {
    const [visible, setVisible] = useState(false);

    return (
        <div className="flex flex-col items-end">
            <button className="rounded transition duration-175 hover:brightness-85" onClick={() => setVisible(!visible)}>
                <Image src="/cart.png" alt="Cart" width={100} height={100} />
            </button>
            {visible && (
                <div className="cart-menu">
                    Cart
                </div>
            )}
        </div>
    );
 }