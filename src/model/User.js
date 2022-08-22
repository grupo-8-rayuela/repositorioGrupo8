const fs = require('fs');
const path = require('path');

const User = {
    filename: path.join(__dirname, '../database/users.json'),
    getAllUsers: () => {
        return JSON.parse( fs.readFileSync(User.filename), 'utf-8')
        },
    findAll: ()=>{
            return User.getAllUsers()
        },
    findByPk: (id)=>{
        let allUsers = User.getAllUsers();
        let userFound = allUsers.find(e => e.id ==id)
        return userFound
    },
    findByField: (field, text)=> {
        let allUsers = User.getAllUsers();
        let userFound = allUsers.find(e => e[field] == text)
        return userFound
    },
    newId: ()=>{
            const allUsers =  User.getAllUsers(); // let lastUser = allUsers.pop() => if(lastUser){ return lastUser.id + 1}
        if(allUsers.length){
         return allUsers[allUsers.length - 1].id +1
        }else{ return 1}
        },
    createUser: (data)=> {
        const allUsers =  User.getAllUsers();
        let obj = {
            id: User.newId(),
            ...data
        }
        allUsers.push(obj);
        fs.writeFileSync(User.filename, JSON.stringify(allUsers, null, ' '), (err)=> {
                        if(err){
            return false
        }} )
        return obj
        
    },
delete: (id)=> {
    const allUsers =  User.getAllUsers();
    let finalUsers = allUsers.filter( e => e.id != id)

    fs.writeFileSync(User.filename, JSON.stringify(finalUsers, null, ' '), (err)=> {
        if(err){
return false
}} )
return finalUsers

},



}

module.exports = User;