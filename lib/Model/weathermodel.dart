 class Weather {
  String? cityname;

  double? temp;

  int? humidity;
  int? pressure;
  // String description;

  Weather({this.cityname  , this.humidity, this.pressure, this.temp});
  Weather.fromJson(Map<String, dynamic> json) {
    cityname = json['name'];
    temp = json['main']['temp'];
    humidity = json['main']['humidity'];
    pressure = json['main']['pressure'];
  }
}