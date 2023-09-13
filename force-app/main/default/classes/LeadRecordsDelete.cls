/*
*********************************************************
Apex Class Name       :  LeadRecordsDelete 
Created Date          :  13-09-2023
@description          :  This batch apex is using to cleanup the lead records which are not move forward or not interested
@author               :  Anil Kumar
*********************************************************
*/

global class LeadRecordsDelete Implements Database.Batchable <sObject> {
    
   global LeadRecordsDelete ( ) {
            
    }

    global Database.queryLocator start(Database.BatchableContext bc) {
        
        String leadRecords = 'SELECT Id FROM Lead where LeadSource = \'Web\'';
        return Database.getQueryLocator( leadRecords );
        
    }

    global void execute( Database.BatchableContext bc, List < Lead> leadRecords ) {
        
        delete leadRecords ;
        
    }

    global void finish( Database.BatchableContext bc ) {
    }

}