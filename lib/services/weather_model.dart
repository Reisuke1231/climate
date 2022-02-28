import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

const apiKey = 'c5a09c24144755b115eb0a83b467611a';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Uri url = Uri.http(
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'units': 'metric',
        'appid': apiKey,
      },
    );

    Networking networking = Networking(url: url);

    var weatherData = await networking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
