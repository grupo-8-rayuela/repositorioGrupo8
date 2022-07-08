

const path = require('path');
const fs = require('fs');
const e = require('express');
const dataPath = path.join(__dirname, '../database/jugetes.json');
const data = JSON.parse(fs.readFileSync(dataPath, "UTF-8"));


module.exports = {
    productList: (req, res) => {
        
        res.render('product/productos', { data }) // products.ejs
    },
    productDetail: (req, res) => {
        let id = req.params.id;
        console.log(id)


        let juguete = data.find(e => e.SKU == parseInt(id));
        console.log(juguete)
        console.log(data)
        if (juguete) {
            res.render('product/productDetail', { juguete })  // productDetail.ejs
        } else {
            res.send("No existe el juguete")
        }


    },

    crearProducto: (req, res) => {
        res.render('product/crearProducto');           // vemos el form en crearProducto.ejs

    },
    productDirect: (req, res) => {
        res.render('/product/productDetail')   // link de home ( / ) a productDetail.ejs ddirecto 
    },
    guardar: (req, res) => {
        let newProduct = req.body;
        data.push(newProduct);
        fs.writeFileSync(dataPath, JSON.stringify(data, null, ' '))

        console.log(newProduct)

        res.redirect('/')
    },

    getCategory: (req, res) => {
        let categoria = req.params.categoria;
        let juguetesCategoria = data.filter(e => ((e.categoria).replace(' ', '').toLowerCase() == categoria))
       

       res.render('product/categoria',{juguetesCategoria})
    },
    /*getEdad: (req,res)=>{
    let categoria = req.params.categoria;
    let juguetesCategoria = data.filter(e => {
        let claseEdad =e.edadRecomendada ;
        let claseCategoria =e.categoria.replace(' ', '').toLowerCase() ;
        
        (claseEdad || claseCategoria) == categoria;
})

console.log(claseEdad)
   console.log(jugueteCategoria)
res.send(categoria)
   //res.render('product/categoria',{juguetesCategoria})*/
}

