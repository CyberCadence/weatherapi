import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weatherapi/Model/weathermodel.dart';
import 'package:weatherapi/Network/Networkfile.dart';
import 'package:weatherapi/View/Widgets/widget1.dart';

import 'package:weatherapi/bloc/weather_bloc.dart';

TextEditingController textEditingController = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff4338CA),
                title: const Center(
                    child: Text(
                  'Weather App',
                  style: TextStyle(fontWeight: FontWeight.w400),
                )),
              ),
              body: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitialstate) {
                    return SafeArea(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Searchbar(
                            searchController: textEditingController,
                            hintText: 'location here'),
                      ),
                    );
                  } else if (state is WeatherLoadingstate) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.yellow,
                      ),
                    );
                  } else if (state is Weatherloadedstate) {
                    return buildnew(state.weathermodel);
                  } else if (state is WeatherErrorstate) {
                    return SafeArea(
                        child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Searchbar(
                              searchController: textEditingController,
                              hintText: 'please recheck location  '),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text('wrong location please check')
                      ],
                    ));
                  }
                  return const Center(
                    child: Text('error'),
                  );
                },
              )));
    }
  }
}

Widget buildnew(Weather weather) {
  return SafeArea(
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Searchbar(
              searchController: textEditingController,
              hintText: 'location here'),
        ),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          weather.cityname.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          weather.temp.toString(),
          style: const TextStyle(fontSize: 20),
        )
      ],
    ),
  );
}
