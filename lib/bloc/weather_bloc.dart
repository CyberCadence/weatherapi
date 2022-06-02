import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapi/Model/weathermodel.dart';
import 'package:weatherapi/Network/Networkfile.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final Repository repository;

  WeatherBloc({required this.repository}) : super(WeatherInitialstate()) {
    on<WeatherEvent>((event, emit) async {
      if (event is loadWeatherDataEvent) {
        emit(WeatherLoadingstate());

        final Weather? weather =
            await repository.getdata(location: event.location);
        if (weather == null) {
          emit(WeatherErrorstate());
        } else {
          emit(Weatherloadedstate(weathermodel: weather));
        }
      }
    });
  }
}
