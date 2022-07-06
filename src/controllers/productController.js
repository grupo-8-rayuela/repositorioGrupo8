const path = require('path');
const fs = require('fs');
const dataPath = path.join(__dirname, '../database/juguetes.json');
const data = JSON.parse(fs.readFileSync(dataPath, 'utf-8'));


const productController = {
    producto : (req, res) => {
        res.render('productDetail')   // productDetail.ejs
    },
    kitmusical : (req, res) => {
        res.render('productDetail')
    },
    create : (req, res) => {
        res.render('productCreate')  // productCreate.ejs
    },
    createSKU : (req, res) => {
        res.render('crearProducto')  // crearProducto SKU
    },
    guardar : (req, res) => {
        let newProduct = req.body
        
        console.log(req.body)
        data.push(newProduct);
        fs.writeFileSync(dataPath, JSON.stringify(data, null, ' ')) 
        console.log(newProduct) 
        res.redirect('/')
    },
    guardarSKU : (req, res) => {
        
    }
}

module.exports = productController;