var express = require('express');
var fs = require('fs');

var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  let users;
  fs.readFile('users_array.json', 'utf8', (err, data) => {
    users =  JSON.parse(data) ;
    res.render('users', { users: users });
  })
});

module.exports = router;
