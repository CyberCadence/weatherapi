import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapi/Network/Networkfile.dart';
import 'package:weatherapi/View/HomePage.dart';
import 'package:weatherapi/bloc/weather_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherBloc(repository: Repository()),
    child: const MyApp(),
  ));
}
