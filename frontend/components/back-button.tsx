"use client";

import React from "react";
import { ArrowLeft } from "lucide-react";
import type { AppRouterInstance } from "next/dist/shared/lib/app-router-context.shared-runtime";

interface GoBackButtonProps {
  router: AppRouterInstance;
  className?: string;
  label?: string;
}

export default function GoBackButton({
  router,
  className = "cursor-pointer",
  label = "Go Back",
}: GoBackButtonProps) {
  return (
    <button
      onClick={() => router.back()}
      className={`fixed left-10 top-24 flex z-[9999] items-center gap-2 text-gray-700 dark:text-gray-200 hover:text-gray-900 dark:hover:text-white transition-colors ${className}`}
    >
      <ArrowLeft className="w-5 h-5" />
      <span className="text-base font-medium">{label}</span>
    </button>
  );
}
