



window.addEventListener('load',function(){

    console.log('Hola')
    
    let botones = document.querySelectorAll('.add-to-cart-button')
    
            for(let boton of botones){
                boton.addEventListener('click',function(){
                    let input = document.querySelector('.input-carrito')
                    console.log(input)
                              })
            }
    
           
            
        

  })


