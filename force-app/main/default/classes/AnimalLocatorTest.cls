@isTest public class AnimalLocatorTest {
    
     @isTest static void testCallout() {
         Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
         integer i = 99;
         String response = AnimalLocator.getAnimalNameById(i);
         System.assertEquals(response, 'trailhead');
     }
}