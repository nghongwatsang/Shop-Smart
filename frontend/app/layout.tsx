import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import {GlobalProvider } from "./context/GlobalContext";
import "./globals.css";

import LogoLink from "@/components/LogoLink";
import CartMenu from "@/components/CartMenu";
import DarkModeToggle from "@/components/DarkModeToggle";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Shop Smart",
  description: "Grocery price comparison app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        <GlobalProvider>
          <LogoLink/>
          <CartMenu/>
          <DarkModeToggle/>
          {children}
        </GlobalProvider>
      </body>
    </html>
  );
}
