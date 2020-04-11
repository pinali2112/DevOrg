public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer numOfCon, String lastNameCon){
        List<Contact> conList = new List<Contact>();
        
        for(Integer i=0;i <numOfCon;i++)
        {
            Contact c = new Contact()    ;
            c.FirstName = randomFirstName();
            c.LastName = lastNameCon;
            conList.add(c);
        }
        
        return conList;
        
    }
    
    public static String randomFirstName(){
        Integer cat = Math.abs(Crypto.getRandomInteger());
        return String.valueOf(cat);
    }
}