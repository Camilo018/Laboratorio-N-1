var express = require('express');
var app = express();


app.get('/', function (req, res) {
  res.send('Hello World!');
  let numbers = [between(10, 300), between(1, 5), between(10, 300), between(1000, 1200), between(5, 15)]
  console.log('El tamaño de la lista es: ' + numbers.length);
  numbers.forEach(element => {
  console.log('El numero ' + element + ' es ' + element.toString(2) + ' en binario');
  });
});

function between(min, max) {  
  return Math.floor(
    Math.random() * (max - min) + min
  )
}

app.listen(3200, function () {
  console.log('La aplicación esta corriendo en el puerto ' + this.address().port);
});