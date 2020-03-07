@isTest
public class AnimalLocatorTest {
    @isTest static void testGetAnimalNameById() {
        // Create the mock response based on a static resource
      	Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test
        String animalName = AnimalLocator.getAnimalNameById(1);
        // Verify the array contains 3 items     
        System.assertEquals(animalName, 'chicken', 'The array should only contain 3 items.');  
    }
}