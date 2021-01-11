var express = require('express');
const fs = require('fs');
var router = express.Router();

const mysql = require('mysql');

var dbConnect = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'rootroot',
    database: 'usersData'
});


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


/* GET home page. */
router.get('/db/users/:id', function(req, res, next) {
  if(+req.params.id <= 0){
    res.redirect('/users');
  } 

  dbConnect.connect( (err) => {
    let sql = `SELECT users.*, GROUP_CONCAT(DISTINCT hobbies.name) as hobbies
            FROM users
            inner join users_hobbies
            on users_hobbies.user_id = users.id
            inner join hobbies
            on users_hobbies.hobby_id = hobbies.id
            where users.id = ` + +req.params.id +`
            GROUP BY user_id;
            `;
    dbConnect.query(sql , (err, user) => {
      console.log('--------------------')
      user[0].hobbies = (user[0].hobbies).split(',');
      console.log(user[0]);
      if(user) res.render('user', { user: user[0] , id : +req.params.id  });
    })
  })
  
  
});

/* GET users listing. */
router.get('/db/users', function(req, res, next) {
  let sql = `SELECT users.*, GROUP_CONCAT(DISTINCT hobbies.name) as hobbies
            FROM users
            inner join users_hobbies
            on users_hobbies.user_id = users.id
            inner join hobbies
            on users_hobbies.hobby_id = hobbies.id
            GROUP BY user_id;
            `;
  dbConnect.connect( (err) => {
    dbConnect.query( sql , (err, users) => {
      if(users) res.render('users', { users: users });
    })
  })
});

module.exports = router;
