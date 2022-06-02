part of 'weather_bloc.dart';

abstract class WeatherEvent {
  WeatherEvent();
}

class loadWeatherDataEvent extends WeatherEvent {
  final String location;

  loadWeatherDataEvent( {required this.location});
}
