window.addEventListener("load", function() {
    console.log('soy js')
    let buttonform = document.querySelector('#form-button');
    
    
    buttonform.addEventListener('click', (e) => {
      console.log('click')
     
      let errores = [];
      let erroresUl = document.querySelector('div.erroresFront ul');
      while (erroresUl.firstChild) {
        erroresUl.removeChild(erroresUl.firstChild);
    };
    
     
    
    const name = document.querySelector('#input-name');
    const description = document.querySelector('.textarea');
    const img = document.getElementById('ppal-img-input');
    
    
    
    
    
    
    if(name.value == ''){
        errores.push('Debes completar el nombre')
           
      }
    if(name.value.length < 5){
        errores.push("El nombre tiene que tener al menos 5 caracteres")
      }
    
      if(description.value.length <20){
        errores.push("La descripcion tiene que tener al menos 20 caracteres")
      }
    
    
    
    
    if(errores.length>0){
        e.preventDefault();
        let erroresUl = document.querySelector('div.erroresFront ul')
        
      errores.map(element=>{
        erroresUl.innerHTML += "<li>" + element + "</li>"
      })
    
    }
    
    
    })
    
    
    })