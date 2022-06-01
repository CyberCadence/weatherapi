import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weatherapi/Model/weathermodel.dart';
import 'package:weatherapi/Network/Networkfile.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Repository repository = Repository();

  Weather? weather;
  Future<void> getdata() async {
    weather = await repository.getdata(location: 'thrissur');
  }

  @override
  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    return MaterialApp(
        home: Scaffold(
            body: FutureBuilder(
                future: getdata(),
                builder: ((context, snapshot) {
                  return Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                      Text(weather!.temp.toString())
                   ,Text(weather!.cityname.toString()), ],),
                  );
                }))));
  }
}
