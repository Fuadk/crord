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
        <bus:ChangeIdentityRequest>
            <bus:requestHeader>
                <crm:version>1</crm:version>
                <crm:businessCode>ChangeNum</crm:businessCode>
                <crm:messageSeq>20181108142142680235</crm:messageSeq>
                <crm:beId>101</crm:beId>
                <crm:regionId>101</crm:regionId>
                <crm:operatorInfo>
                    <crm:operatorCode>Self-derviceTerminal</crm:operatorCode>
                    <crm:orgId>101</crm:orgId>
                </crm:operatorInfo>
                <crm:channelType>605</crm:channelType>
            </bus:requestHeader>
            <bus:orderInfo>
                <!--Optional:-->
                <buc:orderBaseInfo>
                    <buc:remark>pro</buc:remark>
                </buc:orderBaseInfo>
            </bus:orderInfo>
            <bus:subsIdentitys>
                <!-- one or more subscribers -->
                <bus:subscriberId>3411000000008009</bus:subscriberId>
                <!--1 or more repetitions:-->
                <bus:changeSubsIdentitys>
                    <bus:identityType>1</bus:identityType>
                    <!--Optional:-->
                    <bus:identityValue>13409519829</bus:identityValue>
                    <bus:reasonCode>2</bus:reasonCode>
                    <bus:lockCode>3912013660559922</bus:lockCode>
                    <bus:remark>yuanyuan</bus:remark>
                </bus:changeSubsIdentitys>
            </bus:subsIdentitys>
        </bus:ChangeIdentityRequest>
    </soapenv:Body>
</soapenv:Envelope>



</xsl:for-each>		
</xsl:template>		
</xsl:stylesheet>		
