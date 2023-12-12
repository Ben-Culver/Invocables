public class InvocableGetSObjectByIndex {
   
    @invocableMethod(label='Get SObject By Index' description='Returns the SObject at the specified index' category='Apex Enterprise Patterns')
    public List<SObject> getSObjectByIndex(List<Wrapper> wrappers) {
        List<SObject> returnList = new List<SObject>();

        for (Wrapper wrapper : wrappers) {
            returnList.add(wrapper.sObjectList[wrapper.sObjectIndex]);
        }


        return returnList;
    }

    public class Wrapper {
        @InvocableVariable(label='SObject Index' description='The index of the SObject to return' required=true)
        public Integer sObjectIndex;

        @InvocableVariable(label='SObject' description='The SObject to return' required=true)
        public List<SObject> sObjectList;
    }
}