"use strict";

var parser = require ('./grammar.js').parser;
var fs = require ('fs');

    try {
        var data = fs.readFileSync(process.argv[2]).toString();
        fs.writeFileSync("ceva.json", JSON.stringify(parser.parse (data), null, 3));
        
    }
    catch (e) {
        console.log (e.message);
    }