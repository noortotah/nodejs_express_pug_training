var express = require('express');
const fs = require('fs');
var router = express.Router();

var dbConnect = require('../db');
// const mysql = require('mysql');

// var dbConnect = mysql.createConnection({
//     host: 'localhost',
//     user: 'root',
//     password: 'rootroot',
//     database: 'usersData'
// });


/* GET home page. */
router.get('/', function(req, res, next) {
  res.redirect('/users');
});


/* GET users listing from josn. */
router.get('/users', function(req, res, next) {
  let users;
  fs.readFile('users_array.json', 'utf8', (err, data) => {
    users =  JSON.parse(data) ;
    res.render('users', { users: users });
  })
});

/* GET users listing page from json file. */
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




/* GET users listing from db. */
router.get('/db/users', function(req, res, next) {
  let sql = `SELECT users.* , group_concat(distinct hobbies.name)
            FROM users
            
            left join users_hobbies
            on users_hobbies.user_id = users.id
            
            left join hobbies
            on users_hobbies.hobby_id = hobbies.id
            GROUP BY users.id;`;
  dbConnect.connect( (err) => {
    dbConnect.query( sql , (err, users) => {
      if(users) res.render('users', { users: users, db: true });
    })
  })
});


/* GET user page from database . */
router.get('/db/users/:id', function(req, res, next) {
  if(+req.params.id <= 0){
    res.redirect('/users');
  } 

  dbConnect.connect( (err) => {
    let sql = `SELECT users.*, GROUP_CONCAT(DISTINCT hobbies.name) as hobbies
            FROM users
            LEFT join users_hobbies
            on users_hobbies.user_id = users.id
            LEFT join hobbies
            on users_hobbies.hobby_id = hobbies.id
            where users.id = ${+req.params.id}
            GROUP BY user_id;
            `;
    dbConnect.query(sql , (err, user) => {
      if(!user.length) {
        res.redirect('/db/users');
      }else{
        user[0].hobbies = user[0].hobbies ? (user[0].hobbies).split(',') : [];
        if(user) res.render('user', { user: user[0] , id : +req.params.id , db: true });
      }
      
    })
  })
 
});


/* GET user page from database . */
router.delete('/db/users/:id', function(req, res, next) {
  console.log('got here ');
  if(+req.params.id <= 0){
    res.redirect('/users');
  } 

  dbConnect.connect( (err) => {
    let sql = `delete from users where id = ${+req.params.id}`;
    
    dbConnect.query(sql , (err, result) => {
      console.log(resutls);
      res.redirect(req.get('referer'));
      
    })
  })
 
});


router.delete('/gotu/:id', (req, res, nexr) => {
  console.log('gotu');
})


module.exports = router;
