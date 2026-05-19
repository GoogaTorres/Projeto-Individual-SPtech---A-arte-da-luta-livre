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

function exportar(pontuacao, fkUsuario) {
    var instrucao = `
        INSERT INTO quiz (pontuacao, fkUsuario) VALUES ('${pontuacao}', '${fkUsuario}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    importar,
    exportar
};