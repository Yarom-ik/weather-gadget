import { LightningElement, track, wire} from 'lwc';
import getWeather from '@salesforce/apex/WeatherViewController.getWeather';

// const DELAY = 300;

export default class WeatherView extends LightningElement {

    searchKey = '';
    @track weather;
    @track imgUrl;
    // render = false;

    // @wire(getWeather, { searchKey: '$searchKey' })
    // wiredWeather({ error, data }) {
    //     if (data) {
    //         this.weather = data;
    //         this.error = undefined;
    //         this.imgUrl = '';
    //         this.imgUrl = 'http://openweathermap.org/img/wn/' + data.weather[0].icon + '@2x.png';

    //         // eslint-disable-next-line no-console
    //         console.log('weather-url ' + this.imgUrl);
    //     } else if (error) {
    //         this.error = error;
    //         this.weather = undefined;
    //     }
    // }

    @wire(getWeather, { searchKey: '$searchKey' })
    wiredWeather({ error, data }) {
        if (data) {
            this.weather = JSON.parse(data);
            this.error = undefined;
            this.imgUrl = '';
            this.imgUrl = 'http://openweathermap.org/img/wn/' + this.weather.weather[0].icon + '@2x.png';

            // eslint-disable-next-line no-console
            console.log('weather-dd ' + this.weather);
        } else if (error) {
            this.error = error;
            this.weather = undefined;
        }
    }

    setSearchKey(){
        var inp = this.template.querySelector('.slds-input').value
        this.searchKey=inp;
        // eslint-disable-next-line no-console
        console.log(inp);
    }

    handleKeyChange(event) {
        // Debouncing this method: Do not update the reactive property as long as this function is
        // being called within a delay of DELAY. This is to avoid a very large number of Apex method calls.
        // window.clearTimeout(this.delayTimeout);
        this.searchKey = event.target.value;
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        // this.delayTimeout = setTimeout(() => {
        //     this.searchKey = searchKey;
        // }, DELAY);
    }
    // render(){
    //     this.render = false;
    // }


    // renderedCallback() {
    //     if (this.render) {
    //         // eslint-disable-next-line no-console
    //     console.log('if render render');
    //         return;
    //     }
    //     getWeather({ searchKey: this.searchKey})
    //         .then(result => {
    //             this.weather = result;
    //             this.error = undefined;
    //             this.imgUrl = '';
    //             this.imgUrl = 'http://openweathermap.org/img/wn/' + result.weather[0].icon + '@2x.png';

    //             // eslint-disable-next-line no-console
    //             console.log('weather-ddd ' + this.weather.base);
    //         })
    //         .catch(error => {
    //             this.error = error;
    //             this.weather = undefined;
    //         });
    //     this.render = true;
    // }
}