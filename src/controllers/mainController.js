const path = require('path');
const fs = require('fs');
const dataPath = path.join(__dirname,'../database/jugetes.json');
const data =JSON.parse(fs.readFileSync(dataPath,"UTF-8"));

module.exports = {
    index : (req, res) => {
       
        res.render('home', {data, data}); // home ejs
    },
    indexCategorias: (req, res) => {
     
        let categorias= 
            [{categoria: 'Sensoriales', img:"/img/categoria-sensorial.png"},
            {categoria: 'Instrumentos Musicales', img:"/img/categoria-instrumentos.png"},
            {categoria: 'Rompecabezas', img:"/img/categoria-rompecabezas.png"},
            {categoria: 'Movimientos', img:"/img/categoria-movimientos.png"} ,
        ]         //en un futuro agregar a base de datos
        
    let cuatro = [];
    for(let i=0; i<=3; i++){ 
      cuatro.push(data.filter(e => e.enPromo === true)[i]);
      };
      
      if(cuatro.length<4){ 
        for(let i=0; i<(4-cuatro.length);i++){
          cuatro.push(data.filter(e => e.enPromo !== true)[i])
        }
      }
        res.render('porCategoria', {data, categorias, cuatro}); // prueba de pagina home dinamica
    },
    indexEdad: (req, res) => {
        let edad=
        [{edad: '6a1Año', img:"/img/categoria-6meses.png"},
         {edad: '1a3Años', img:"/img/categoria-1año.png"},
         {edad: '3a6Años', img:"/img/categoria-3años.png"},
         {edad: 'masDe6Años', img:"/img/categoria-6años.png"} ,
        ]    
        res.render('porEdad', {data, edad}); 
    }
}