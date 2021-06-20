<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ccap="http://ericsson.com/services/ws_cma3/ccapisubscribercreate" xmlns:cus="http://ericsson.com/services/ws_cma3/customernew" xmlns:mon="http://lhsgroup.com/lhsws/money" xmlns:add="http://ericsson.com/services/ws_cma3/addresswrite" xmlns:cus1="http://ericsson.com/services/ws_cma3/customerwrite" xmlns:cus2="http://ericsson.com/services/ws_cma3/customerread" xmlns:con="http://ericsson.com/services/ws_cma3/contractnew" xmlns:ses="http://ericsson.com/services/ws_cma3/sessionchange">		
<xsl:output method="xml" indent="yes" encoding="UTF-8" /> 		
<xsl:template match="/">		
<xsl:for-each select="data">		


<soapenv:Envelope
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:bus="http://www.huawei.com/bes/business/businessservices"
	xmlns:crm="http://www.huawei.com/bes/crminterface/crmheader"
	xmlns:com="http://www.huawei.com/bes/crminterface/common">
	<soapenv:Header/>
	<soapenv:Body>
		<bus:GenerateAcctCodeRequest>
			<bus:requestHeader>
				<crm:version>1.00</crm:version>
				<crm:businessCode>GenerateAcctCode</crm:businessCode>
				<crm:messageSeq>20181108142142680218</crm:messageSeq>
				<crm:beId>101</crm:beId>
				<crm:channelType>1001</crm:channelType>
			</bus:requestHeader>
			<bus:generateAcctCodeRequest></bus:generateAcctCodeRequest>
		</bus:GenerateAcctCodeRequest>
	</soapenv:Body>
</soapenv:Envelope>



</xsl:for-each>		
</xsl:template>		
</xsl:stylesheet>		
