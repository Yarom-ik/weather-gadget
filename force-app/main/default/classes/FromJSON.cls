public class FromJSON {
    
	@AuraEnabled
	public cls_coord coord;
	@AuraEnabled
	public cls_weather[] weather;
	@AuraEnabled
	public String base;	//stations
	@AuraEnabled
	public cls_main main;
	@AuraEnabled
	public Integer visibility;	//10000
	@AuraEnabled
	public cls_wind wind;
	@AuraEnabled
	public cls_clouds clouds;
	@AuraEnabled
	public Integer dt;	//1485789600
	@AuraEnabled
	public cls_sys sys;
	@AuraEnabled
	public Integer id;	//2643743
	@AuraEnabled
	public String name;	//London
	@AuraEnabled
	public Integer cod;	//200

	public class cls_coord {
		@AuraEnabled
		public Double lon;	//-0.13
		@AuraEnabled
		public Double lat;	//51.51
	}
	public class cls_weather {
		@AuraEnabled
		public Integer id;	//300
		@AuraEnabled
		public String main;	//Drizzle
		@AuraEnabled
		public String description;	//light intensity drizzle
		@AuraEnabled
		public String icon;	//09d
	}
	public class cls_main {
		@AuraEnabled
		public Double temp;	//280.32
		@AuraEnabled
		public Double pressure;	//1012
		@AuraEnabled
		public Integer humidity;	//81
		@AuraEnabled
		public Double temp_min;	//279.15
		@AuraEnabled
		public Double temp_max;	//281.15
		@AuraEnabled
		public Double sea_level;
		@AuraEnabled
		public Double grnd_level;
	}
	public class cls_wind {
		@AuraEnabled
		public Double speed;	//4.1
		@AuraEnabled
		public Double deg;	//80
	}
	public class cls_clouds {
		@AuraEnabled
		public Integer all;	//90
	}
	public class cls_sys {
		@AuraEnabled
		public Integer type;	//1
		@AuraEnabled
		public Integer id;	//5091
		@AuraEnabled
		public Double message;	//0.0103
		@AuraEnabled
		public String country;	//GB
		@AuraEnabled
		public Integer sunrise;	//1485762037
		@AuraEnabled
		public Integer sunset;	//1485794875
	}
}