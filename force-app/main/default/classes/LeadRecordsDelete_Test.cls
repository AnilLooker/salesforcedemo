/*
*********************************************************
Apex Class Name       :  LeadRecordsDelete 
Created Date          :  13-09-2023
@description          :  This batch apex is using to cleanup the lead records which are not move forward or not interested
@author               :  Anil Kumar
*********************************************************
*/
@isTest
private class LeadRecordsDelete_Test{
    
    static testMethod void testMassDel() {
        Lead l= new Lead(
            LastName = 'Test Lead',
            Company = 'ColinCar',
            Email = 'test@testreply.com',
            LeadSource = 'Web'
        );
        insert l;
        Test.startTest();
        LeadRecordsDelete ldel= new LeadRecordsDelete ( );
        Database.executeBatch( ldel);
        Test.stopTest();
        Assert.areEqual( 0, [ SELECT COUNT() FROM Lead] );
        
    }

}