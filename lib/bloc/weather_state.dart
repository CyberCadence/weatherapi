part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialstate extends WeatherState {}

class WeatherLoadingstate extends WeatherState {}

class Weatherloadedstate extends WeatherState {
  final Weather weathermodel;

  Weatherloadedstate({required this.weathermodel});
}
class WeatherErrorstate extends WeatherState{}