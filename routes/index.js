var express = require('express');
const fs = require('fs');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.redirect('/users');
});


/* GET home page. */
router.get('/users/:id', function(req, res, next) {
  if(+req.params.id <= 0){
    res.redirect('/users');
  } 
  let user;
  fs.readFile('users_array.json', 'utf8', (err, data) => {
    user =  JSON.parse(data)[+req.params.id -1 ] ;
    if(user) res.render('user', { user: user , id : +req.params.id  });
    else  res.redirect('/users');

  })
  
  
});

module.exports = router;
