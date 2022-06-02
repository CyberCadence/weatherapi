import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapi/Model/weathermodel.dart';

class Repository {
  Future<Weather?> getdata({required String location}) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=c1b66d13f980552b4cdd1123f5c20c72#';

    final result = await http.get(Uri.parse(url));
    if (result.statusCode != 200) {
      return null;
    }
    final decodeddata = jsonDecode(result.body);
 
    return Weather.fromJson(decodeddata);
  }
}
