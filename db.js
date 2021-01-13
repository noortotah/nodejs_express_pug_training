'user strict';

var mysql = require('mysql');

//local mysql db connection
var dbConnect = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'rootroot',
    database : 'usersData'
});

dbConnect.connect((err) => {
    if (err) throw err;
});

module.exports = dbConnect;