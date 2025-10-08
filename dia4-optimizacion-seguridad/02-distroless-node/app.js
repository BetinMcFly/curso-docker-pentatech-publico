const http = require("http");
const PORT = 4000;

http.createServer((req, res) => {
  res.end("Hello from Distroless\n");
}).listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
