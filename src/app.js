const express = require('express');
const app = express();
const path = require('path');
const mainRouter = require('./routes/mainRouter');
const userRouter = require('./routes/userRouter');
const productRouter = require('./routes/productRouter');

app.use(express.static(path.join(__dirname,'../public')));

app.set('view engine', 'ejs'); // motor de plantillas ejs

app.set('views','src/views');   // Para no tener que escribir toda la ruta

app.use(express.urlencoded({ extended: false }));  //capturainfo formulario y si queremos lo pasa json
app.use(express.json());

app.use('/', mainRouter);

app.use( userRouter);

app.use( productRouter);



app.set('puerto',process.env.PORT || 3000)

app.listen(app.get('puerto'), ()=>console.log(`Servidor escuchando en puerto ${app.get('puerto')}`));



