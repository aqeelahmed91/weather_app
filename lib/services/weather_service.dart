import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  String BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
  String apiKey;

  WeatherService({required this.apiKey});

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(
        Uri.parse("${BASE_URL}?q=${cityName}&appid=${apiKey}&units=metric"));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed");
    }
  }

  Future<String> getCityName() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Get current location

    LocationSettings locationSettings =
        LocationSettings(accuracy: LocationAccuracy.high);

    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);

    // convert coords to city name
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);

    String? cityName = (placemarks[0].locality == "")
        ? placemarks[0].country
        : placemarks[0].locality;

    return cityName ?? "";
  }
}
