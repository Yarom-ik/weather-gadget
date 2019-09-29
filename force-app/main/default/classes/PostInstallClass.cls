global with sharing class PostInstallClass implements InstallHandler {
    global void onInstall(InstallContext context) {        
        if(context.previousVersion() == null) {
            Weather__c weather = new Weather__c(defaultCity__c = 'Minsk,by',
                              accessToken__c = 'e48eede6efa31effe0285c71cb02ee75',
                              name = 'weather',
                              url__c = 'https://api.openweathermap.org/data/2.5/weather?');    
            insert weather;
        }

    }
}
