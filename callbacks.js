var http = require('http'),  
request = require('request'),  
fs = require('fs'),
async = require('async');

var port = 8787;
var serviceRootUrl = 'http://localhost:8585';

http.createServer(function(req, res){

    if(req.url==="/log"){
        console.log("8787 request for log")
        async.series([ //use async.parallel for faster running
            getTemperature, 
            getLight
        ],
        function(err,results){
            console.log("results: ", results)
            var logEntry = 'Temperature: ' + results[0] + ' Light: ' +    results[1];
            fs.appendFile('log.txt', logEntry + '\n', encoding = 'utf8', function (err) {   
                if (err) throw err;   
                res.writeHeader(200, {"Content-Type": "text/plain"});   
                res.write(logEntry);   
                res.end(); 
            })
        })
    }
    else{
        res.writeHeader(200, {"Content-Type": "text/plain"});    
        res.write('Please use /log');    
        res.end();
    }
}).listen(port)

console.log('Server listening on http://localhost:' + port);

function getTemperature(callback) {  
    console.log("getting Temperature")
    request({url: serviceRootUrl + '/temperature', json: true},    
        function (err, res, body) {
            if (err) {
                console.log("error getting temperature: ", err)
                callback(err)
            }
            if (res && res.statusCode === 200) {
                console.log(body);
                var temp = body.temperature;
                callback(null, temp);   //call the next function in the series
            } 
            else {
                console.log("no temp")
                callback(null, null);  //call the next function in the series
            }
        }
    );
}

function getLight(callback) {  
    request({url: serviceRootUrl + '/light', json: true},   
    function (err, res, body) {
        if (err) {
            console.log("error getting light: ", err)
            callback(err);
        }
        if (res && res.statusCode === 200) {
            console.log(body);
            var light = body.light;
            callback(null, light); 
        } else {
            console.log("no light")
            callback(null, null);  
        } 
    });
}