@isTest
public class AccountTrigger_Test {
    
    @isTest  static void TestCreateAccountInBulk(){
        
        List<Account> ac_list = new List<Account>();
        for (Integer i=0; i < 200; i++){
            
            Account a = new Account();
            a.Name = 'Test Household' + i;
            ac_list.add(a);
        }
        
        Test.startTest();
        insert ac_list;
        Test.stopTest();
        
        //Verify number of accounts inserted
        List<Account> ac_v = [Select Id, Name from Account];
        system.assertEquals(200, ac_v.size());
        
        //verify number of opportunities created
        List<Opportunity> opp_v = [Select Id, Name from Opportunity];
        system.assertEquals(200, opp_v.size());
    }
    

}