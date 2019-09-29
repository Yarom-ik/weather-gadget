@isTest
public with sharing class WeatherViewControllerTest {

    @TestSetup
    static void initUserData(){      
        insert new Weather__c(defaultCity__c = 'Minsk',
                              accessToken__c = '435345',
                              url__c = 'sdfdfsd');    
    }

    static StaticResourceCalloutMock initMoc(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('weather');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        return mock;
    }

    @isTest
    public static void testWeatherViewControllerWithUserCity() {  
        User user = new User();
        user.Username ='tesstemail@test.com';
        user.LastName = 'LasatTestName';
        user.Email = 'teastemail@test.com';
        user.alias = 'tesatAl';
        user.City = 'Grodno';
        user.IsActive = true;
        user.TimeZoneSidKey = 'America/New_York';
        user.LocaleSidKey = 'en_US';
        user.EmailEncodingKey = 'ISO-8859-1';
        user.ProfileId = [select id from Profile where Name='System Administrator'].Id;
        user.LanguageLocaleKey = 'en_US';
        insert user; 
        Test.setMock(HttpCalloutMock.class, initMoc());    
        // Call method to test
        Test.startTest();
        String result;
        System.runAs(user){
            result = WeatherViewController.getWeather('Minsk');
        Test.stopTest();
        }
        System.assertNotEquals(null ,result, 'The callout returned a null response.');
        System.assertEquals('{"coord":{"lon":27.56,"lat":53.9},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":283.15,"pressure":1011,"humidity":93,"temp_min":283.15,"temp_max":283.15},"visibility":6000,"wind":{"speed":3,"deg":170,"gust":6},"clouds":{"all":90},"dt":1569687064,"sys":{"type":1,"id":8939,"message":0.0086,"country":"BY","sunrise":1569643512,"sunset":1569686152},"timezone":10800,"id":625144,"name":"Minsk","cod":200}' 
                            ,result);

    }

    @isTest
    public static void testWeatherViewController() {    
        Test.setMock(HttpCalloutMock.class, initMoc());       
        Test.startTest();
        String result = WeatherViewController.getWeather('Minsk');
        Test.stopTest();
        System.assertNotEquals(null ,result, 'The callout returned a null response.');
        System.assertEquals('{"coord":{"lon":27.56,"lat":53.9},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":283.15,"pressure":1011,"humidity":93,"temp_min":283.15,"temp_max":283.15},"visibility":6000,"wind":{"speed":3,"deg":170,"gust":6},"clouds":{"all":90},"dt":1569687064,"sys":{"type":1,"id":8939,"message":0.0086,"country":"BY","sunrise":1569643512,"sunset":1569686152},"timezone":10800,"id":625144,"name":"Minsk","cod":200}' 
                            ,result);

    }

    @isTest
    public static void testWeatherViewControllerCityNull() {       
        Test.setMock(HttpCalloutMock.class, initMoc());    
        // Call method to test
        Test.startTest();
        String result = WeatherViewController.getWeather(null);
        Test.stopTest();
        System.assertNotEquals(null ,result, 'The callout returned a null response.');
        System.assertEquals('{"coord":{"lon":27.56,"lat":53.9},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":283.15,"pressure":1011,"humidity":93,"temp_min":283.15,"temp_max":283.15},"visibility":6000,"wind":{"speed":3,"deg":170,"gust":6},"clouds":{"all":90},"dt":1569687064,"sys":{"type":1,"id":8939,"message":0.0086,"country":"BY","sunrise":1569643512,"sunset":1569686152},"timezone":10800,"id":625144,"name":"Minsk","cod":200}' 
                            ,result);

    }

    @isTest
    public static void testWeatherViewControllerError150() {   
        StaticResourceCalloutMock mock = initMoc();
        mock.setStatusCode(150);    
        Test.setMock(HttpCalloutMock.class, mock);    
        // Call method to test
        Test.startTest();
        String result;
        try{
            result = WeatherViewController.getWeather('Minsk');
        } catch(Exception e){
            
        }
        
        Test.stopTest();
        System.assertEquals(null ,result);
    }
}
