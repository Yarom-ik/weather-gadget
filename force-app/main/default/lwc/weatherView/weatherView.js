import { LightningElement, track, wire } from 'lwc';
import getWeather from '@salesforce/apex/WeatherViewController.getWeather';

export default class WeatherView extends LightningElement {

    searchKey = '';
    @track weather; //use parse to JSON  
    @track imgUrl;
    @track error;

    // load weather on open page
    @wire(getWeather, { searchKey: '$searchKey' })
    wiredWeather({ error, data }) {
        if (data) {
            this.weather = JSON.parse(data);
            this.error = undefined;
            this.imgUrl = '';
            this.imgUrl = 'http://openweathermap.org/img/wn/' + this.weather.weather[0].icon + '@2x.png';
            this.weather.main.temp = Math.floor(this.weather.main.temp);
            this.weather.main.temp_min = Math.floor(this.weather.main.temp_min);
            this.weather.main.temp_max = Math.floor(this.weather.main.temp_max);
        } else if (error) {
            this.error = JSON.parse(error.body.message);
            this.weather = undefined;
        }
    }

    // set search city in input text
    setSearchKey() {
        var inp = this.template.querySelector('.slds-input').value
        this.searchKey = inp;
    }

}