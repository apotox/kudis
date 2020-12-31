const express = require("express");
const socketio = require("socket.io");
const redisAdapter = require("socket.io-redis");
const app = express();

const port = process.env.port || 5000;
const REDIS_HOST = process.env.REDIS_HOST || "172.17.0.2";
const REDIS_PORT = process.env.REDIS_PORT || 6379;

app.set("views", __dirname + "/views");
app.set("view engine", "html");
app.engine("html", require("ejs").renderFile);

app.get("/", require("./routes").home);

const server = app.listen(port, () => {
  console.log(`${process.env.WELCOME_MSG}, App started listning to ${port}`);
});

const io = socketio(server, {
  adapter: redisAdapter({ host: REDIS_HOST, port: REDIS_PORT }),
});

io.on("connection", (socket) => {
  socket.on("hi", (message) => {
    console.log("recieving ", message, " from socketId: ", socket.id);

    //broadcast the message over all pods (instance's) clients
    socket.broadcast.emit("message", `${socket.id}: ${message}`);
  });
});
