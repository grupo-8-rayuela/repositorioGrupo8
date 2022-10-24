window.addEventListener('load', ()=>{
    const btnMenu = document.querySelector('#btnMenu');
    const menu = document.querySelector('#menu');
    const banner = document.querySelector('.header-top-banner');
    const header = document.querySelector('.header-style');
    
    
    btnMenu.addEventListener('click', ()=>{
    menu.classList.toggle('mostrar')
    })
    
        const subMenuBtnUno = document.getElementById('submenu-btn-1'); 
                subMenuBtnUno.addEventListener('click', () => {
                                    if(window.innerWidth < 750){
                                        const subMenu =   subMenuBtnUno.nextElementSibling;
                                        console.log(subMenu)
    
                                       if(subMenu.classList.contains('desplegar')){
                                            subMenu.classList.remove('desplegar');
                                            subMenu.removeAttribute('style')
                                            }else{
                                                    subMenu.classList.add('desplegar');
                                                    subMenu.style.height = "150px";
    
                                                    }
                                        
     
                                    }
                    })
    
    
    const subMenuBtnDos = document.getElementById('submenu-btn-2'); 
        subMenuBtnDos.addEventListener('click', () => {
                                        if(window.innerWidth < 750){
                                            const subMenu =   subMenuBtnDos.nextElementSibling;
                                            console.log(subMenu)
        
                                           if(subMenu.classList.contains('desplegar')){
                                                subMenu.classList.remove('desplegar');
                                                subMenu.removeAttribute('style')
                                                }else{
                                                        subMenu.classList.add('desplegar');
                                                        subMenu.style.height = "200px";
        
                                                        }
                                            
         
                                        }
                        });
     window.addEventListener('scroll',function(){
    let submenu = document.querySelector('.submenu');
    let submenuEdades = document.querySelector('#subMenuEdades')
    
        banner.style.display='none';
        submenu.style.top='130px';
        submenuEdades.style.top='130px';
    });
    


})

