exports.home = function (req, res) {
  res.render("index", { title: "SOCKET" , pod: process.env.HOSTNAME || "POD" });
};
