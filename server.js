const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Usha Node.js App deployed on AWS ECS Fargate!");
});

app.listen(3000, () => console.log("Server running on port 3000"));
