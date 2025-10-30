import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import {GlobalProvider } from "./context/GlobalContext";
import "./globals.css";

import LogoLink from "@/components/LogoLink";
import DarkModeToggle from "@/components/DarkModeToggle";
import { SidebarProvider } from "@/components/ui/sidebar";
import { AppSidebar } from "@/components/app-sidebar";
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
          <SidebarProvider>
            <main className="p-10">
              <div className="flex flex-row justify-between p-10 fixed top-0 left-0 z-50">
                <LogoLink/>
                <DarkModeToggle/>
              </div>
              
              {children}
              <CartTrigger />
            </main>
            <AppSidebar />
          </SidebarProvider>
        </GlobalProvider>
      </body>
    </html>
  );
}
