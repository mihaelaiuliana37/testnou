public with sharing class testapexvscode {
    public testapexvscode() {
        List<Opportunity> opp = [SELECT Id, StageName, CloseDate FROM Opportunity];
        for(Opportunity opps : opp){
            if(opps.StageName == 'Closed Won'){
                opps.CloseDate = system.today();
            }
        update opps;
        }
    }
}