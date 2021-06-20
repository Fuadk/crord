
var http = require('http');
var parseString = require('xml2js').parseString;
var resultInfo ;

module.exports = {

	sendData: function(hostConfig,bodyToSend,action)
    {
		function processCTRLChars (value, name) {
		  //console.log("processCTRLChars:name:",name, " value:", value);
		  if ( (name =="TriggerText") || (name =="ProgramUnitText") )
			{
			  value = value.split("&#10;").join("\r");
			  //value = value.split("&amp;").join("&");
			}
		  return value
		}

		function  handleResponseEnd( msgResponse){
			console.log("-------msgResponse:" ,  msgResponse);


			var status = extractStatus ( msgResponse);
			RequestInProgress = false;
			//console.log("-------handleResponse:status:" ,  status);
		}

		var handleResponse = function(response){
		  var msgResponse = ''
		  response.on('data', function (chunk) {
			msgResponse += chunk;
		  });
		  response.on('end', function () {
			 handleResponseEnd( msgResponse);
 		  });

		}

		  function setStrAuth(hostConfig){
			var userName = hostConfig.userName;
			var password =  hostConfig.password;
			var StrAuth = userName + ":" + password;
			let buff = new  Buffer.alloc(StrAuth.length, StrAuth);
			let base64data = buff.toString('base64');
			//console.log ("base64data:", base64data);
			authorization = "Basic " + base64data;;
			return authorization;

		  }

/////////////////
			function extractStatus ( msgResponse)
			{
				
				parseString(msgResponse, {attrValueProcessors: [processCTRLChars]}, function (err, result) {
					//console.log("result:",result['soapenv:Envelope']);
					var data = result['soapenv:Envelope'];
					//console.log("data:",data['soapenv:Body']);
					var data2 = data['soapenv:Body'][0];
					//console.log("data2:",data2['bus:GenerateAcctCodeResponse']);
					var data3 = data2['bus:GenerateAcctCodeResponse'][0];
					//console.log("data3:",data3);
					//console.log("data3:responseHeader:",data3['bus:responseHeader']);
					var data4 = data3['bus:responseHeader'][0];
		
					//console.log("data4:",data4['crm:resultCode'][0]);
					//console.log("data3:acctCode:",data3['bus:acctCode'][0]);

					var resultCode = data4['crm:resultCode'][0];
					var acctCode = data3['bus:acctCode'][0];
					
				resultInfo = {"resultCode": resultCode, "acctCode":acctCode};

				});
				//console.log("-------resultInfo:" ,  resultInfo);

				return resultInfo;
			}


		function performHttpPost (hostConfig,bodyToSend,action)
		{

			var	valid = false;
			var error = 0;
			var msg = "";

			var options = {
			  host: '',
			  path: '',
			  port: 80,
			  method: 'GET',
			  headers: {
			  //'Content-Type': 'application/json',
//			  'Content-Type': 'text/xml; charset=utf-8',
			  'Content-Type': 'text/xml; charset=utf-8',
			  'connection': 'keep-alive',
		       "accept": '*/*',
			  'accept-language': 'en-US,en;q=0.5',
			  'accept-encoding': 'gzip, deflate',
			  "authorization": ""
			  }
			};

	
			options.host = hostConfig.host;
			options.port = hostConfig.port;
			options.path = hostConfig.path;
			options.method = hostConfig.method;
			options.headers.authorization = setStrAuth(hostConfig);;
			
			valid = true;

			if (valid)
			{
				//console.log("options:",options);


				//async
				var reqNew = http.request(options, function(response){ handleResponse(response); }); 
				RequestInProgress = true;

				reqNew.on('error', function(err) {
					// Handle error
					error = err;
					msg = "Error sending to Host :" +hostConfig.host ;
					console.log( msg + " Error:" + err );
					if ( RequestInProgress == true )	// as on error may trigger several times, so only one time LogRule called for PK constraint
					{
						rulefunc.LogRule(ruleLog, msg + " Error:" + err, 400 );
						RequestInProgress = false;
					}
				});

				//console.log("------bodyToSend:" + bodyToSend);
				reqNew.write(bodyToSend);
				//console.log("here2");
				reqNew.end();
				//console.log("here3:reqNew:", reqNew);
				
                if (action.ACTION_CODE == "SEND_WAIT")
                {
                  while(RequestInProgress === true) {
					//console.log("--SEND_WAIT:RequestInProgress:", RequestInProgress);
                    require('deasync').runLoopOnce();             
                   }
                }
    
			}
			//console.log("-------resultInfo:" ,  resultInfo);


			return (resultInfo);

		}

////////////////////			

		resultInfo = performHttpPost (hostConfig,bodyToSend,action);

		return resultInfo;

	}
};
