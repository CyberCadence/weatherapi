import 'package:flutter/material.dart';
 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapi/Model/weathermodel.dart';
import 'package:weatherapi/Network/Networkfile.dart';
 
import 'package:weatherapi/bloc/weather_bloc.dart';

TextEditingController textEditingController = TextEditingController();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    {
      Repository repository = Repository();
      return MaterialApp(
          home: Scaffold(body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialstate) {
            context.read<WeatherBloc>().add(
                loadWeatherDataEvent(location: textEditingController.text));

            return const Center(
              child: CircularProgressIndicator(color: Colors.red,),
            );
          } else if (state is WeatherLoadingstate) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.yellow,),
            );
          } else if (state is Weatherloadedstate) {
            return buildnew(state.weathermodel);
          } else if (state is WeatherErrorstate) {
            return const Center(
              child: Text('error state'),
            );
          }
          return const Center(
            child: Text('error'),
          );
        },
      )));
    }
  }
}

// Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }

//   return await Geolocator.getCurrentPosition();
// }

Widget buildnew(Weather weather) {
  return Column(
    children: [
      TextField(
          controller: textEditingController,
          onChanged: (value) {
        
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          )),
      Text(weather.cityname.toString())
    ],
  );
}
