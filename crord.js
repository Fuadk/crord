var fs = require('fs');
const config = require('config');
const foldersConfig = config.get('runtime.foldersConfig');
const hostConfig = config.get('runtime.hostConfig');


const csv=require('csvtojson')

//npm install libxslt
var xsltmap = require("./xsltmap.js")
var sendhttp = require("./sendhttp.js")



var csvName = "orders.csv";

var allXslt ={};
function initXslt()
{
	var xsltFolder = foldersConfig.xsltFolder  ;

	allXslt.ChangeSubsIdentity_c_Sample_Request  = fs.readFileSync(xsltFolder + "ChangeSubsIdentity_c_Sample_Request.xslt");
	allXslt.GenerateAcctCode_Sample_Request  = fs.readFileSync(xsltFolder + "GenerateAcctCode_Sample_Request.xslt");
	allXslt.SubmitOrder_Sample_Request  = fs.readFileSync(xsltFolder + "SubmitOrder_Sample_Request.xslt");
}
function parseLine(lineRead, XsltName){
	console.log("lineRead:", lineRead);
	var bodyToSendArr	= lineRead;
	var bodyToSend ="";
	bodyToSend = xsltmap.mapData(bodyToSendArr, XsltName);
	var action = {"ACTION_CODE":"SEND_WAIT"};
	//console.log("bodyToSend:", bodyToSend);
	//var bodyToSend = [{"a":"b1"}];
	//bodyToSend = JSON.stringify(bodyToSend)
	var resultInfo = sendhttp.sendData(hostConfig,bodyToSend,    action);
	console.log("-------resultInfo:" ,  resultInfo);

}

function processCSV2Json (csvName, XsltName)
{
	const csvFilePath=csvName;
	csv({
		noheader:false,
		})
	.fromFile(csvFilePath)
	.then((jsonObj)=>{
		for (var i = 0; i < jsonObj.length; i++)
		{
			parseLine(jsonObj[i], XsltName);
		}

		//console.log(jsonObj);
	})
}

initXslt();

processCSV2Json(csvName, allXslt.SubmitOrder_Sample_Request);
