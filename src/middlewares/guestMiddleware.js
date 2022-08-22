function guestMiddleware (req, res, next) {
    
    if (req.session.userLogged) {
        // let id = req.session.userLogged.id
        let userDetail = req.session.userLogged
        return res.render('users/userDetail', { 'userDetail': userDetail })
    }
    next();
};

module.exports = guestMiddleware;
