"use client";
import React, {useState, useEffect} from 'react';
import { Moon, Sun } from 'lucide-react';

export default function DarkModeToggle() {
    const [isDarkMode, setIsDarkMode] = useState(false);

    // Toggle dark mode by adding or removing the "dark" class on the HTML element.
    useEffect(() => {
        if (isDarkMode) {
            document.documentElement.classList.add("dark");
        } else {
            document.documentElement.classList.remove("dark");
        }
    }, [isDarkMode]);

    return (
        <button
            onClick={() => setIsDarkMode((prev) => !prev)}
            className="p-2 rounded-full transition delay-150 duration-5000 cursor-pointer"
            aria-label={isDarkMode ? "Switch to light mode" : "Switch to dark mode"}
        >
            {isDarkMode ? (
                <Sun className="h-5 w-5 text-yellow-400" />
            ) : (
                <Moon className="h-5 w-5 text-gray-800" />
            )}
        </button>
    );
}