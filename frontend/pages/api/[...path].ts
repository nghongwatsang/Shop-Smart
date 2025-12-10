export default function handler(req, res) {
  console.log("HIT PROXY:", req.query);
  res.json({ proxy: true, path: req.query.path });
}

