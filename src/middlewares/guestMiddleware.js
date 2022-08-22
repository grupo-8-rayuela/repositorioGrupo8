function guestMiddleware(req,res,next){
    if (req.session.userLogged == undefined){
        next ();
    }else{
        res.send ("Esta pagina es solo para invitados - Usted ya se encuentra registrado");
    }}
    module.exports = guestMiddleware;
