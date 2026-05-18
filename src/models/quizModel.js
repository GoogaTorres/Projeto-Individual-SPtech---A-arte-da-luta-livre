var database = require("../database/config")

function importar() {
    var instrucao = `
        SELECT * FROM quiz;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function quizesRealizados() {
    var instrucao = `
        SELECT COUNT(idQuiz) FROM quiz;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);    
}

function exportar(pontuacao) {
    var instrucao = `
        INSERT INTO quiz (pontuacao) VALUES ('${pontuacao}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    importar,
    exportar
};