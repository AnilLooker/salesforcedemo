/*
*********************************************************
Apex Trigger Name     :  OpportunityTrigger 
Created Date          :  13-09-2023
@description          :  This trigger used for making callouts or syncing opportunity data into other system
@author               :  Anil Kumar
*********************************************************
*/
trigger OpportunityTrigger on Opportunity (after insert, after update) {

    for (Opportunity opp: Trigger.new) {
        // Make a callout
        OpportunityTriggerHanler.syncOpportunityDetails(opp.Name, opp.StageName, opp.Amount);
    }

}