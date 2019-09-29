public with sharing class UpdateWeather {

    public String updateWeather(String searchKey) {

        String city;
        String weather;

        // get worked user 
        User user = [SELECT Id,
          			City,
                    FirstName,
                    LastName
                    FROM User WHERE Id = : UserInfo.getUserId()];
        // get costom settings
        Weather__c weatherCM = [select id, accessToken__c, url__c, defaultCity__c from Weather__c];
        if(String.isNotEmpty(user.city)){
            city = user.city;
        } else if (String.isNotEmpty(searchKey)) {
            city = searchKey;
        } else {
             city = weatherCM.defaultCity__c;
        }

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(weatherCM.url__c + 'q=' + city + '&units=metric&appid=' + weatherCM.accessToken__c);

        try {        
            HttpResponse response = http.send(request);            
            if (response.getStatusCode() == 200) {
                weather = response.getBody();
            } else {
                throw new CalloutException(response.getBody());
            }                
        } catch(Exception ex) {  
            throw ex; 
        }  
        return weather;
    }
}