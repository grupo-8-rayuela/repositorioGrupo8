window.addEventListener("load", function() {
let formLogin = document.querySelector("#formLogin");
let botonForm = document.querySelector("#botonLogin")

botonForm.addEventListener("click", function(e) {

let errores = [];

let ulErrores = document.querySelector('div.errores ul');
        while (ulErrores.firstChild) {
            ulErrores.removeChild(ulErrores.firstChild);
        }
        console.log(ulErrores);


 let mailLogin = document.querySelector("input.emailLogin");
 if (mailLogin.value == "") {
    errores.push("Debes completar el campo con un email")     
 }


 let passwordLogin = document.querySelector("input.passwordLogin");
  if (passwordLogin.value.length <= 8) {
    errores.push("La password debe tener al menos 8 caracteres")
  }
 
  if (errores.length > 0) {
    e.preventDefault();
    let ulErrores = document.querySelector("div.errores ul");
    for (let i = 0; i < errores.length; i++) {
        ulErrores.innerHTML += "<li>" + errores[i] + "</li>"
    }
  }

 })

})