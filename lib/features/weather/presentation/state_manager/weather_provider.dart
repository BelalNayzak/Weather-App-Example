import 'package:flutter/material.dart';
import 'package:weather_app_md/core/utils/ui_utils/ui_utils.dart';

import '../../domain/entities/weather.dart';
import '../../domain/use_cases/get_weather.dart';

class WeatherProvider extends ChangeNotifier {
  final GetWeather getWeather;

  WeatherProvider({required this.getWeather});

  Weather? _weather;
  Weather? get weather => _weather;

  bool _loading = false;
  bool get loading => _loading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchWeather(String cityName) async {
    _loading = true;
    notifyListeners();

    try {
      final weather = await getWeather(cityName);
      _weather = weather;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Could not fetch weather';
      UiUtils.showErrorMessage(message: _errorMessage!);
      _weather = null;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}