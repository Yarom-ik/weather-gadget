public with sharing class WeatherViewController {

    @AuraEnabled(cacheable=true)
    public static String getWeather(String searchKey) {
            UpdateWeather updateWeather = new UpdateWeather();
            FromJSON weather = new FromJSON();
            weather = updateWeather.updateWeather(searchKey);     

            String str = '{"coord":{"lon":27.56,"lat":53.9},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"}],"base":"stations","main":{"temp":283.15,"pressure":1011,"humidity":93,"temp_min":283.15,"temp_max":283.15},"visibility":7000,"wind":{"speed":5,"deg":160},"clouds":{"all":90},"dt":1569683338,"sys":{"type":1,"id":8939,"message":0.0068,"country":"BY","sunrise":1569643512,"sunset":1569686152},"timezone":10800,"id":625144,"name":"Minsk","cod":200}';
        return str;

    }

}