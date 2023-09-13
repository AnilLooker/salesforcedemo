/*
*********************************************************
Apex Class Name       :  OpportunityTriggerHanler
Created Date          :  13-09-2023
@description          :  This trigger used for making callouts or syncing opportunity data into other system
@author               :  Anil Kumar
*********************************************************
*/
public class OpportunityTriggerHanler{
    @future (callout=true)
    public static void syncOpportunityDetails(string oppName, string stageName, decimal oppAmount) {
        try{
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            Http http = new Http();
             
            request.setEndpoint('Endpoint URL');
            request.setHeader('Content-Type','application/json'); 
            request.setMethod('POST');
            request.setBody('OppName='+EncodingUtil.urlEncode(oppName, 'UTF-8')+'&Stage='+EncodingUtil.urlEncode(stageName, 'UTF-8') + '&amount='+oppAmount);
            request.setCompressed(true);
             
            response = http.send(request);
            if (response.getStatusCode() == 200) {
                System.debug('Response-' + response);
            }
        }
        catch(System.CalloutException e){
            System.debug('Error-' + e.getMessage());   
        }
    }
}