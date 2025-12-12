import type { NextApiRequest, NextApiResponse } from "next";

export default async function handler(req: NextApiRequest, res: NextApiResponse) {
  const pathArray = req.query.path;
  console.log("Proxy hit:", req.query.path);
  
  if (!pathArray) {
    return res.status(400).json({ error: "Missing path" });
  }

  // Ensure it's an array of strings
  const pathSegments = Array.isArray(pathArray) ? pathArray : [pathArray];

  const baseUrl = process.env.NEXT_PUBLIC_API_BASE_URL || 'http://localhost:3003';
  const params = new URLSearchParams(req.query as any);
  params.delete("path"); // remove Next.js catch-all param
  const searchParams = params.toString();

  const backendUrl = `${baseUrl}/api/${pathSegments.join("/")}/${searchParams ? `?${searchParams}` : ""}`;
  try {
    const response = await fetch(backendUrl, {
      method: req.method,
      headers: { "Content-Type": "application/json" },
      body: req.method !== "GET" ? JSON.stringify(req.body) : undefined,
    });

    const data = await response.json();
    res.status(response.status).json(data);
  } catch (err) {
    res.status(500).json({ error: "Failed to fetch from backend", details: err });
  }
}
