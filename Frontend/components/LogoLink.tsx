import React from "react";
import Image from "next/image";
import Link from "next/link";

// Standard logo linking to the homepage for all pages

export default function LogoLink() {
    return (
        <Link href="/">
            <Image src="/LOGO2-transparent.png" alt="Homepage" width={100} height={100} className="transition duration-175 hover:brightness-85"/>
        </Link>
    );
}