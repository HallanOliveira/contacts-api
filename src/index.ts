import express from "express";

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// rota de teste
app.get("/", (req, res) => {
  res.send("Contacts API está rodando 🚀");
});

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});