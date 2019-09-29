public with sharing class WeatherViewController {

    @AuraEnabled(cacheable=true)
    public static String getWeather(String searchKey) {
        UpdateWeather updateWeather = new UpdateWeather();
        return updateWeather.updateWeather(searchKey); 
    }

}