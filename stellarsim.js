var express = require('express')
var http = require('http');
var fs = require('fs');

const config = require('config');
const foldersConfig = config.get('runtime.foldersConfig');
var http_to_use = http;


var app = express()
var bodyParser = require("body-parser");

var xmlparser = require('express-xml-bodyparser');
app.use(xmlparser());
const port = 3000
	var httpsOption = {
	};

http_to_use.createServer(httpsOption, app).listen(port, function () {
	console.log("Server running on port :", port, " ", "http")
});


var allxml ={};
function initxml()
{
	var xmlFolder = foldersConfig.xsltFolder  ;
	console.log("xmlFolder:", xmlFolder);

	allxml.GenerateAcctCode_Sample_Response  = fs.readFileSync(xmlFolder + "GenerateAcctCode_Sample_Response.xml");
	 allxml.GenerateAcctCode_Sample_Response = allxml.GenerateAcctCode_Sample_Response.toString();
		console.log("GenerateAcctCode_Sample_Response:", allxml.GenerateAcctCode_Sample_Response);
}

initxml();

app.post('/', (req, res, next) => {
	//console.log("received",req);
	console.log("req.headers:", req.headers);
	console.log("req.body:", req.body);
	console.log("req._parsedUrl:", req._parsedUrl);
  res.send(allxml.GenerateAcctCode_Sample_Response);
})



