import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'c5a09c24144755b115eb0a83b467611a';

class NetworkHelper {
  NetworkHelper({required this.url});

  final Uri url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      //var weather = jsonDecode(data)['list'][0]['weather'][0]['description'];
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
