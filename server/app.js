var express = require('express');
var bodyParser = require('body-parser');


var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('client/'));


app.listen(3001, () => {
    console.log('le serveur tourne sur le port 3001');
});
