const path = require("path");
const fs = require("fs");
const e = require("express");
const { Console } = require("console");
const dataPath = path.join(__dirname, "../database/jugetes.json");
const data = JSON.parse(fs.readFileSync(dataPath, "UTF-8"));

 

module.exports = {
  productList: (req, res) => {
    res.render("product/productos", { data }); // products.ejs
  },

  productDetail: (req, res) => {                                        
    let id = req.params.id;
    console.log(id);
    
    let juguete = data.find((e) => e.id == parseInt(id));   
  
   if (juguete) {
    let categoriaJuguete = juguete.categoria

    let cuatro = [];
        for(let i=0; i<=3; i++){ 
          cuatro.push(data.filter(e => e.categoria === categoriaJuguete)[i])
          };
          
          if(cuatro.length<4){ 
            for(let i=0; i<(4-cuatro.length);i++){
              cuatro.push(data.filter(e => e.categoria !== juguete.categoria)[i])
            }
          }
      res.render("product/productDetail", { juguete, cuatro});           
    } else {
      res.send("No existe el juguete");
    }
  },

  productDirect: (req, res) => {
    res.render("/product/productDetail"); // link de home ( / ) a productDetail.ejs ddirecto
  },
  create: (req, res) => {
    res.render("product/crearProducto"); // vemos el form en crearProducto.ejs
  },
  saveNewProduct: (req, res) => {
    let id = data[data.length - 1].id;
    let newId = id + 1;

    let newProduct = {
      id: newId,
      nombre: req.body.nombre,
      precio: req.body.precio,
      enPromo: req.body.enpromo,
      descuento: req.body.descuento,
      categoria: req.body.categoria,
      imagenPrincipal: req.body.imagenPrincipal,
      imagenesAdicionales: req.body.imagenesAdicionales,
      descripcion: req.body.descripcion,
      edadRecomendada: req.body.edadRecomendada,
      materiales: req.body.materiales,
      altura: req.body.altura,
      ancho: req.body.ancho,
      profundidad: req.body.profundidad,
    };

       data.push(newProduct);

       fs.writeFile(dataPath, JSON.stringify(data), (error) => {
        if (error) {
          res.send(error);
        } else {
          res.redirect("/");
        }
      });

  },

  getCategory: (req, res) => {
    let categoria = req.params.categoria;
    let juguetesCategoria = data.filter(
      (e) => e.categoria.replace(" ", "").toLowerCase() == categoria
    );

    res.render("product/categoria", { juguetesCategoria });
  },

  getEdad: (req, res) => {
    let edad = req.params.edadrecomendada;

    let juguetesXedad = data.filter((e) =>
      e.edadRecomendada.includes(edad) ? e : ""
    );

    res.render("product/edades", { juguetesXedad });
  },

  edit: (req, res) => {
    let id = parseInt(req.params.id);
    let jugueteEdit = data.find((e) => e.id == id);
    res.render("product/edit-form", { jugueteEdit });
    /*do magic*/
  },
  saveEdit: (req, res) => {
    let sameId = parseInt(req.params.id);

    const {
      id,
      nombre,
      precio,
      enPromo,
      descuento,
      categoria,
      imagenPrincipal,
      imagenesAdicionales,
      descripcion,
      edadRecomendada,
      materiales,
      ancho,
      altura,
      profundidad,
    } = req.body;


    product = data.find((e) => e.id == sameId);

    if (product) {
        product.id = sameId;
        product.nombre = nombre;
        product.precio = precio;
        product.enPromo = enPromo;
        product.descuento = descuento;
        product.categoria=  categoria;
        product.imagenPrincipal =  imagenPrincipal;
        product.imagenesAdicionales = imagenesAdicionales;
        product.descripcion= descripcion;
        product.edadRecomendada= edadRecomendada;
        product.materiales= materiales;
        product.altura= altura;
        product.ancho= ancho;
        product.profundidad= profundidad;
        
      } else {
      res.sendStatus(404);
    }

    fs.writeFile(dataPath, JSON.stringify(data), (error) => {
      if (error) {
        res.send(error);
      } else {
        res.redirect("/");
      }
    });
  },

  delete: (req, res) => {
    const id = req.params.id;

    let productDelete = data.filter((e) => e.id != parseInt(id));

    console.log(productDelete);

    fs.writeFile(dataPath, JSON.stringify(productDelete), (error) => {
      if (error) {
        res.send("Error" + error);
      } else {
        res.render("/");
      }
    });
  },

editDelete: (req, res) => {
    res.render("product/controlPanel", { data }); //listado de productos para edita o borrar
  },


  search: (req,res)=>{
    let name = req.query.keywords;               //busca jguetes en editdelete
    
    
    if(name){ 
      let searchResult = data.filter(e => e.nombre.toLowerCase().includes(name.toLowerCase()));

     ( searchResult.length>0 ) ? res.render('product/searchResults', {searchResult}) : res.sendStatus(404);
      

      }else{
        res.render('/product/editDelete')} 
  },


};
