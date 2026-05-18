var quizModel = require("../models/quizModel");

function importar(req, res) {
    quizModel.importar().then(function(resultado){
        // precisamos informar que o resultado voltará para o front-end como uma resposta em json
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

function quizesRealizados(req, res) {
    quizModel.quizesRealizados().then(function(resultado){
        // precisamos informar que o resultado voltará para o front-end como uma resposta em json
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

function exportar(req, res) {
    var pontuacao = req.body.pontuacaoServer;

    if (pontuacao == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }

    quizModel.exportar(pontuacao).then(function(resposta){
        res.status(200).send("Quiz criado com sucesso");
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
}

module.exports = {
    importar,
    quizesRealizados,
    exportar
}