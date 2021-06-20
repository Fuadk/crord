<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ccap="http://ericsson.com/services/ws_cma3/ccapisubscribercreate" xmlns:cus="http://ericsson.com/services/ws_cma3/customernew" xmlns:mon="http://lhsgroup.com/lhsws/money" xmlns:add="http://ericsson.com/services/ws_cma3/addresswrite" xmlns:cus1="http://ericsson.com/services/ws_cma3/customerwrite" xmlns:cus2="http://ericsson.com/services/ws_cma3/customerread" xmlns:con="http://ericsson.com/services/ws_cma3/contractnew" xmlns:ses="http://ericsson.com/services/ws_cma3/sessionchange">		
<xsl:output method="xml" indent="yes" encoding="UTF-8" /> 		
<xsl:template match="/">		
<xsl:for-each select="data">		

<soapenv:Envelope
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:bus="http://www.huawei.com/bes/business/businessservices"
	xmlns:crm="http://www.huawei.com/bes/crminterface/crmheader"
	xmlns:com="http://www.huawei.com/bes/crminterface/common"
	xmlns:buc="http://www.huawei.com/bes/business/bucommon">
	<soapenv:Header/>
	<soapenv:Body>
		<bus:NewSubscriberRequest>
			<bus:requestHeader>
				<crm:version>1.00</crm:version>
				<crm:businessCode>NewInstall</crm:businessCode>
				<crm:messageSeq>100120181108142142680218</crm:messageSeq>
				<crm:beId>101</crm:beId>
				<crm:operatorInfo>
					<crm:operatorCode>ExtInt1001</crm:operatorCode>
					<crm:orgId>6038515318</crm:orgId>
				</crm:operatorInfo>
				<crm:channelType>1001</crm:channelType>
			</bus:requestHeader>
			<bus:orderInfo>
				<buc:orderBaseInfo>
					<buc:salesCode>cm40001</buc:salesCode>
				</buc:orderBaseInfo>
				<buc:feeItemInfo>
					<buc:feeItem>
						<buc:payMode>1</buc:payMode>
						<buc:feeType>O</buc:feeType>
						<buc:chargeCode>Purchasefee</buc:chargeCode>
						<buc:quantity>1</buc:quantity>
						<buc:amount>90000</buc:amount>
						<buc:includedTax>Y</buc:includedTax>
						<buc:remark>24</buc:remark>
					</buc:feeItem>
				</buc:feeItemInfo>
			</bus:orderInfo>
			<bus:custInfo>
				<buc:custBasicInfo>
					<buc:custType>1</buc:custType>
					<buc:regionId>1</buc:regionId>
					<buc:regionName>1</buc:regionName>
					<buc:segment>Consumer</buc:segment>
					<buc:subSegment>TMStaff</buc:subSegment>
					<buc:segmentCode>R10</buc:segmentCode>
				</buc:custBasicInfo>
				<buc:certificationInfo>
					<buc:idType>Passport</buc:idType>
					<buc:idNumber>878317670205022011</buc:idNumber>
					<buc:issueCountry>china</buc:issueCountry>
				</buc:certificationInfo>
				<buc:individualInfo>
					<buc:individualId>685511421541810703</buc:individualId>
					<buc:firstName>gVa</buc:firstName>
					<buc:middleName>uUD</buc:middleName>
					<buc:lastName>Qnw</buc:lastName>
					<buc:title>1</buc:title>
					<buc:birthday>1998-08-10T20:18:00.000+00:00</buc:birthday>
				</buc:individualInfo>
			</bus:custInfo>
			<bus:subscribers>
				<bus:subsBasicInfo>
					<buc:paymentType>0</buc:paymentType>
					<buc:subsVoiceLang>2002</buc:subsVoiceLang>
					<buc:subsWrittenLang>2002</buc:subsWrittenLang>
					<buc:status>2</buc:status>
					<buc:subName>gVaQnw</buc:subName>
					<buc:operType>1</buc:operType>
				</bus:subsBasicInfo>
				<bus:subsIdentity>
					<buc:serviceNumber><xsl:value-of select="serviceNumber"/></buc:serviceNumber>
					<buc:imsi><xsl:value-of select="imsi"/></buc:imsi>
					<buc:iccid><xsl:value-of select="iccid"/></buc:iccid>
					<buc:lockCode><xsl:value-of select="lockCode"/></buc:lockCode>
				</bus:subsIdentity>
				<bus:passwordInfo>
					<buc:scenarioType>3</buc:scenarioType>
					<buc:newPassword>321456</buc:newPassword>
					<buc:idType>Passport</buc:idType>
					<buc:idNumber>878317670205022011</buc:idNumber>
				</bus:passwordInfo>
				<bus:offeringInsts>
					<buc:operType>1</buc:operType>
					<buc:primaryFlag>Y</buc:primaryFlag>
					<buc:quantity>1</buc:quantity>
					<buc:offeringBasicInfo>
						<buc:offeringId>2018082306</buc:offeringId>
						<buc:activeMode>I</buc:activeMode>
					</buc:offeringBasicInfo>
					<buc:props>
						<buc:operType>1</buc:operType>
						<buc:propBasicInfo>
							<buc:propId>601030200288</buc:propId>
							<buc:sourceId>2018082306</buc:sourceId>
							<buc:propCode>PM_InitialBalance</buc:propCode>
							<buc:complexFlag>N</buc:complexFlag>
							<buc:propValue>0</buc:propValue>
						</buc:propBasicInfo>
					</buc:props>
					<buc:props>
						<buc:operType>1</buc:operType>
						<buc:propBasicInfo>
							<buc:propId>1478848289073239599</buc:propId>
							<buc:sourceId>2018082306</buc:sourceId>
							<buc:propCode>PM_DELIVERY_LIMIT_AD</buc:propCode>
							<buc:complexFlag>N</buc:complexFlag>
							<buc:propValue>0</buc:propValue>
						</buc:propBasicInfo>
					</buc:props>
				</bus:offeringInsts>
			</bus:subscribers>
		</bus:NewSubscriberRequest>
	</soapenv:Body>
</soapenv:Envelope>



</xsl:for-each>		
</xsl:template>		
</xsl:stylesheet>		
