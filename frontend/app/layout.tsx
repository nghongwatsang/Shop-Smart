import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import {GlobalProvider } from "./context/GlobalContext";
import "./globals.css";

import LogoLink from "@/components/LogoLink";
import DarkModeToggle from "@/components/DarkModeToggle";
import { SidebarProvider } from "@/components/ui/sidebar";
import { CartSidebar } from "@/components/cart-sidebar";
import { CartTrigger } from "@/components/CartTrigger";

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
          <SidebarProvider defaultOpen={false}>
            <main className="flex overflow-hidden box-border">
              <div className="flex flex-row justify-between fixed top-8 left-8 z-50">
                <LogoLink/>
                <DarkModeToggle/>
              </div>
              {children}
              <CartTrigger />
            </main>
            <CartSidebar />
          </SidebarProvider>
        </GlobalProvider>
      </body>
    </html>
  );
}
