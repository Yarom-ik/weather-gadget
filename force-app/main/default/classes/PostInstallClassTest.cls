@isTest
public with sharing class PostInstallClassTest {
    
    @isTest
    static void testInstallScript() {
        PostInstallClass postinstall = new PostInstallClass();
        Test.testInstall(postinstall, null);
        List<Weather__c> weather = [select id, accessToken__c, url__c, defaultCity__c from Weather__c];
        System.assertEquals(weather.size(), 1, 'weatherCM not found');
    }
}
