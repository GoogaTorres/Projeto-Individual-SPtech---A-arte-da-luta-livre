var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.post("/exportar", function (req, res) {
    // FUNÇÃO PARA ENVIAR DADOS
    quizController.exportar(req, res);
});

router.get("/importar", function (req, res) {
    // FUNÇÃO PARA RECEBER DADOS
    quizController.importar(req, res);
});

router.get("/quizesRealizados", function (req, res) {
    // FUNÇÃO PARA RECEBER DADOS
    quizController.importar(req, res);
});

module.exports = router;