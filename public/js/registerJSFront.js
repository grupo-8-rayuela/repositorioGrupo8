window.addEventListener("load", function() {
    
  let registerButton = document.querySelector(".register-button")
  console.log("soy un JS del Front")

  // let errores = [];

  registerButton.addEventListener("click", function(e) {
  
   let errores = [];
  console.log("hice click")

  let ulErrores = document.querySelector('div.errores ul');
  while (ulErrores.firstChild) {
      ulErrores.removeChild(ulErrores.firstChild);
      }
      console.log(ulErrores);

      

      let nombreRegister = document.querySelector("input.name-register");
       if (nombreRegister.value == "") {
          // console.log("El Name está vacío")
          errores.push("Debes completar tu nombre")   
          console.log(errores)  
       }
  
       let apellidoRegister = document.querySelector("input.apellido-register");
       if (apellidoRegister.value == "") {
        // console.log("El apellido está vacío")
        errores.push("Debes completar tu apellido")  
        console.log(errores)     
       }

       let emailRegister = document.querySelector("input.email-register");
       if (emailRegister.value == "") {
        // console.log("El mail está vacío")
          errores.push("Debes completar tu email") 
          console.log(errores)      
       }

      //  let imgRegister = document.querySelector(".fotoPerfilRegister");
      //  if (imgRegister.value.includes(".jpg") || imgRegister.value.includes(".jpeg") 
      //  || imgRegister.value.includes(".png") || imgRegister.value.includes(".gif")) {
      //   console.log("La img está vacía")
      //     errores.push("Debes cargar una imagen con formato jpg o png")     
      //  }

       let passwordRegister = document.querySelector(".password-register");
        if (passwordRegister.value.length <= 8) {
          // console.log("La passowrd está vacía")
          errores.push("La password debe tener al menos 8 caracteres")
          console.log(errores);
        }

        let passwordConfirmRegister = document.querySelector(".password-confirm-register");
        if (passwordConfirmRegister.value.length <= 8) {
          console.log("La password confirm está 8 dig ")
          errores.push("La confirmación de la password debe tener al menos 8 caracteres")
        }

        if (passwordConfirmRegister.value == "") {
          console.log("La password confirm está vacía")
          errores.push("Debes completar la confirmación de la password")
        }

       console.log(errores,"final")

        if (errores.length > 0) {
          e.preventDefault();
          let ulErrores = document.querySelector("div.errores ul");
          for (let i = 0; i < errores.length; i++) {
          ulErrores.innerHTML += "<li>" + errores[i] + "</li>"
          }
        }
      
       })

})