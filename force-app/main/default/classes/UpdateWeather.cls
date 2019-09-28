public with sharing class UpdateWeather {

    public FromJSON updateWeather(String searchKey) {

        String city;

        User user = [SELECT Id,
          			City,
                    FirstName,
                    LastName
                    FROM User WHERE Id = : UserInfo.getUserId()];
        Weather__c weatherCM = [select id, accessToken__c, url__c, defaultCity__c from Weather__c];
        if(user.city != null){
            city = user.city;
            System.debug('user city ' + user.city);
        }
        if (String.isNotEmpty(searchKey)) {
            city = searchKey;
        } else {
            city = weatherCM.defaultCity__c;
        }
        System.debug('user ' + user);
        
        System.debug('city = ' + city);
        System.debug('appid = ' + weatherCM.defaultCity__c);


        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(weatherCM.url__c + 'q=' + city + '&units=metric&appid=' + weatherCM.accessToken__c);
        HttpResponse response = http.send(request);

        FromJSON weather = new FromJSON();
        if (response.getStatusCode() == 200) {
            weather = (FromJSON) JSON.deserialize(response.getBody(), FromJSON.class);
            weather.main.temp = Math.round(weather.main.temp);
            weather.main.temp_min = Math.round(weather.main.temp_min);
            weather.main.temp_max = Math.round(weather.main.temp_max);
             System.debug('response = ' + response.getBody());
             System.debug('weather = ' + weather.main.temp_max);
        }  else {
            return null;
        } 
        System.debug('responseerror = ' + response.getBody());    
        System.debug('weatherReturn = ' + weather);  

        
		return weather;
    }
}