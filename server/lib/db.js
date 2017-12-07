//configuration de la connexion à la base de données
var mysql = require('mysql');
var params = { 
	host: '', 
	user: '', 
	password: '', 
	database: ''}
	
exports.connection = function () {
    var db = mysql.createConnection(params);
    return db;
}
this.connection().connect()
