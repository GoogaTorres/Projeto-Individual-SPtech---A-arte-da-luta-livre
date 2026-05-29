var database = require("../database/config")

function importar() {
    var instrucao = `
        SELECT COUNT(idQuiz) FROM quiz;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function quizesRealizados() {
    var instrucao = `
        SELECT COUNT(idQuizRealizado) AS 'quizes_realizados' FROM quizRealizado;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);    
}

function exportar(fkUsuario, fkQuiz, pontuacao) {
    var instrucao = `
        INSERT INTO quizRealizado (fkUsuario, fkQuiz, pontuacao, dataHora) VALUES ('${fkUsuario}', '1', '${pontuacao}', NOW());
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    database.executar(instrucao);
}

module.exports = {
    importar,
    exportar,
    quizesRealizados
};