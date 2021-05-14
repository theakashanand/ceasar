var http = require("http")
var request = require('request');

var port = 8585

function randomInt(low, high) {
    return Math.floor(Math.random() * (high - low) + low);
}

request('http://webofthings.org', function(error,response,body){   
    if (!error && response.statusCode === 200) {    
        console.log(body)   
    }
})

http.createServer(function(req, res){
    //req: client request
    //res: result to be sent back to to the client
    console.log('New incoming client request for ' + req.url);
    res.writeHeader(200, {'Content-Type': 'application/json'}); //200 indicates success

    switch(req.url) {     
        case '/temperature':
            res.write('{"temperature" :' + randomInt(1, 40) + '}');
            break;    
        case '/light':
            res.write('{"light" :' + randomInt(1, 100) + '}');
            break;    
        default:res.write('{"hello" : "world"}');
    }

    res.end();
}).listen(port); 

console.log('Server started on port: ',8585 );