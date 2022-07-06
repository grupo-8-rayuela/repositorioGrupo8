const mainController = {
    index : (req, res) => {
        let arrayMock = [
            {
                nombre: "Banco didáctico",
                precio: "$ 4800",
                cuotas: "3 cuotas de $1600"
            },
            {
                nombre: "Cocodrilo de arrastre",
                precio: "$ 3200",
                cuotas: "3 cuotas de $1066"
            },
            {
                nombre: "Cohete multifunción",
                precio: "$ 7900",
                cuotas: "3 cuotas de $2630"
            },
            {
                nombre: "Mesa de expresión",
                precio: "$ 4500",
                cuotas: "3 cuotas de $1500"
            },
            {
                nombre: "Torre geométrica",
                precio: "$ 1600",
                cuotas: "3 cuotas de $530"
            },
            {
                nombre: "Carro andador",
                precio: "$ 2500",
                cuotas: "3 cuotas de $830"
            }
           ]

        res.render('home', {arrayMock, arrayMock}); // home ejs
    }
}

module.exports = mainController;