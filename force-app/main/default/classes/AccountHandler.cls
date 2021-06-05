public with sharing class AccountHandler {
    public static void createNewOpportunity(List<Account> acnts){
        List<Opportunity> opp_list = new List<Opportunity>();
        for(Account a : acnts){
            Opportunity o = new Opportunity();
            o.Name = a.Name + 'HouseHold' + system.Date.today();
            o.AccountId = a.Id;
            o.StageName = 'Prospecting';
            o.CloseDate = System.Today().addMonths(1);
            
            opp_list.add(o);
            
        }
        if (opp_list.size() > 0){
            insert opp_list;
        }
		        
    }

}