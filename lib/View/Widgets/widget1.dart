import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapi/bloc/weather_bloc.dart';

import '../../Model/weathermodel.dart';
import '../../Network/Networkfile.dart';

class Searchbar extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;

  const Searchbar(
      {required this.searchController, required this.hintText, Key? key})
      : super(
          key: key,
        );
  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xff4338CA), Color(0xff6D28D9)]),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
      child: TextField(
        controller: searchController,
        textAlign: TextAlign.center,
        onSubmitted: (value) {
         context.read<WeatherBloc>().add(loadWeatherDataEvent(
                      location: searchController.text));
        },
        style: TextStyle(fontSize: 14, color: accentColor),
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.email),
          prefixIcon: Icon(Icons.search, size: 20, color: accentColor),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: TextStyle(color: accentColor.withOpacity(.75)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
 
}
