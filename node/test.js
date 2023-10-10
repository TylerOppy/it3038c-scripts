$ node test.js
var path = require("path");

“Hello, World”
var hello = "Hello from Node JS Variable!"
`console.log(hello)`

console.log (`Printing variable hello: ${hello}`);

console.log("directory name: " + __dirname); 
console.log("directory and file name: " + __filename); 

console.log("Using PATH module:");
console.log(`Hello from file ${path.basename(__filename)}`);

console.log(`Process args: ${process.argv}`)
