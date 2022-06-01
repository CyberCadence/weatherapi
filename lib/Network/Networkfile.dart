import 'dart:convert';

import 'package:http/http.dart' as http;

class Repository {
  Future getdata({required String location}) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c1b66d13f980552b4cdd1123f5c20c72#';

    final result = await http.get(Uri.parse(url));

    if (result.statusCode == 200) {
       final decodeddata=  jsonDecode(result.body);



    }
  } 
}
 