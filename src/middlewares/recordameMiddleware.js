
// const usersJson = require('../database/users.json');


function recordameMiddleware (req,res,next){
    next();
    if (req.cookies.recordame != undefined &&
        req.session.userLogged == undefined) {
    let usersJSON = fs.readFileSync('users.json', {encoding: 'utf-8'});
    let users;
    if(usersJSON == "") {
    users = [];
    } else {
    users = JSON.parse(usersJSON);
    }
    let userToLogin;
    for (let i = 0; i < users.length; i++) {
        if (users[i].email == req.cookies.recordame){
            userToLogin = users[i];
            break;
        }
    }
    req.session.userLogged = userToLogin;
    }
}
module.exports = recordameMiddleware;