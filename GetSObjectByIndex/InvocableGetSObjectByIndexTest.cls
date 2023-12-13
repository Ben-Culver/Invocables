@isTest
public class InvocableGetSObjectByIndexTest {
    @TestSetup
    public static void setup(){
        List<Account> accounts = new List<Account>{
                new Account(Name='test0', NumberOfEmployees=0),
                new Account(Name='test1', NumberOfEmployees=1),
                new Account(Name='test2', NumberOfEmployees=2),
                new Account(Name='test3', NumberOfEmployees=3),
                new Account(Name='test4', NumberOfEmployees=4)
        };

        insert accounts;

    }

    @IsTest
    static void getSObjectByIndex_given_good_index() {

        InvocableGetSObjectByIndex.InputWrapper inputWrapper = new InvocableGetSObjectByIndex.InputWrapper();
        inputWrapper.theList = [SELECT Id, NumberOfEmployees FROM Account ORDER BY NumberOfEmployees ASC];
        inputWrapper.index_Number = 3;
        List<InvocableGetSObjectByIndex.InputWrapper> wrapperList = new List<InvocableGetSObjectByIndex.InputWrapper>{inputWrapper};
        Account result = (Account)InvocableGetSObjectByIndex.getSObjectByIndex(wrapperList)[0];

        System.assertEquals(3,result.NumberOfEmployees);
    }

    @IsTest
    static void getSObjectByIndex_given_bad_index_right() {

        InvocableGetSObjectByIndex.InputWrapper inputWrapper = new InvocableGetSObjectByIndex.InputWrapper();
        inputWrapper.theList = [SELECT Id, NumberOfEmployees FROM Account ORDER BY NumberOfEmployees ASC];
        inputWrapper.index_Number = 13;
        List<InvocableGetSObjectByIndex.InputWrapper> wrapperList = new List<InvocableGetSObjectByIndex.InputWrapper>{inputWrapper};
        Account result = (Account)InvocableGetSObjectByIndex.getSObjectByIndex(wrapperList)[0];

        if (result != null) {
            System.assertEquals(null,result.NumberOfEmployees);

        }
    }

    @IsTest
    static void getSObjectByIndex_given_bad_index_left() {

        InvocableGetSObjectByIndex.InputWrapper inputWrapper = new InvocableGetSObjectByIndex.InputWrapper();
        inputWrapper.theList = [SELECT Id, NumberOfEmployees FROM Account ORDER BY NumberOfEmployees ASC];
        inputWrapper.index_Number = -   3;
        List<InvocableGetSObjectByIndex.InputWrapper> wrapperList = new List<InvocableGetSObjectByIndex.InputWrapper>{inputWrapper};
        Account result = (Account)InvocableGetSObjectByIndex.getSObjectByIndex(wrapperList)[0];

        if (result != null) {
            System.assertEquals(null,result.NumberOfEmployees);

        }
    }
}