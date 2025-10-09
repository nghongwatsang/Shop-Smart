import React from "react";
import { Input } from "@/components/ui/input"

export default function SearchPage() {
    return(
        <section>
            <Input type="searchbar" placeholder="Search" className="w-1/2 flex flex-col justify-center"/>
            <div>Test</div>
        </section>
    );
}