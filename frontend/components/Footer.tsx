import React, {useState, useEffect} from 'react';


export default function Footer() {
    // This is gonna have more information about our webpages or website, just dark mode toggle for now

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
        <div>
            <div className="flex items-center">
                <label className="flex items-center cursor-pointer">
                    <div className="relative">
                    <input
                        type="checkbox"
                        className="sr-only"
                        checked={isDarkMode}
                        onChange={() => setIsDarkMode((prev) => !prev)}
                    />
                    <div className="w-11 h-6 bg-gray-300 dark:bg-gray-600 rounded-full" />
                    <div
                        className={`absolute left-1 top-1 bg-white w-4 h-4 rounded-full transition-transform ${
                        isDarkMode ? "translate-x-5" : ""
                        }`}
                    ></div>
                    </div>
                    <span className="ml-3  text-lg font-bold">
                    Enable Dark Mode
                    </span>
                </label>
            </div>
        </div>
    );
}