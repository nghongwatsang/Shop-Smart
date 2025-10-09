"use client"
import React from "react";
import Image from "next/image";
import Link from "next/link";

export default function LogoLink() {
    return (
        <Link href="/">
            <Image src="/LOGO2-transparent.png" alt="Homepage" width={100} height={100} />
        </Link>
    );
}