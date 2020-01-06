global class ScheduleOppUpdates implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Opportunity> opps = [SELECT Id, Name, Date_time_extra_minut__c, risc_aprobare_finala_nou__c, risc_aprobare_finala_dupa_update__c FROM Opportunity WHERE Date_time_extra_minut__c = :datetime.now()];
        for(Opportunity opp : opps) {           
                System.debug('each opp: ' + opp.Name);
        }      
    }
}