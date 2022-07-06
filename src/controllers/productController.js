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

    },
    guardarSKU : (req, res) => {
        
    }
}

module.exports = productController;