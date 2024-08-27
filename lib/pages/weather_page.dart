import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/components/app_drawer.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherService _weatherService =
      WeatherService(apiKey: "YOUR_API_KEY_FROM_OPENWEATHERMAP");
  Weather? _weather;

  void fetchWeather() async {
    final city = await _weatherService.getCityName();
    try {
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      throw Exception("Failed to load weather");
    }
  }

  String getAnimation(String mainCondition) {
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'haze':
      case 'smmoke':
      case 'dust':
      case 'fog':
        return "assets/animations/clouds.json";
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return "assets/animations/rain.json";
      case 'thunderstorm':
        return "assets/animations/thunder.json";
      case 'clear':
        return "assets/animations/sunny.json";
      default:
        return "assets/animations/sunny.json";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Weather"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: (_weather == null)
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: Colors.redAccent,
                          size: 40,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _weather?.cityName ?? "Loading",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                    Lottie.asset(
                        getAnimation(_weather?.mainCondition ?? 'rain')),
                    Text(
                      "${_weather?.temperature.toStringAsFixed(0)}℃" ??
                          "Loading...",
                      style: TextStyle(
                          fontFamily: "Oswald",
                          fontSize: 50,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ]),
      ),
    );
  }
}
