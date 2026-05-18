var express = require("express");
var router = express.Router();

var testeController = require("../controllers/testeController");

router.post("/cadastrar", function (req, res) {
    // função a ser chamada quando acessar /carros/cadastrar
    testeController.cadastrar(req, res);
});

router.get("/listar", function (req, res) {
    // função a ser chamada quando acessar /carros/listar
    testeController.listar(req, res);
});

module.exports = router;