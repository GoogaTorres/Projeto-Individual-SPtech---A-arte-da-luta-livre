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
    var fkUsuario = req.body.fkUsuarioServer;
    var pontuacao = req.body.pontuacaoServer;
    

    if (pontuacao == undefined) {
        res.status(400).send("Sua pontuacao está undefined!");
    }

    if (fkUsuario == undefined) {
        res.status(400).send("Seu fkUsuario está undefined!");
    }

    quizModel.exportar(fkUsuario, 1, pontuacao).then(function(resposta){
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