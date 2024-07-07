import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather({required this.repository});

  Future<Weather> call(String cityName) async {
    return await repository.getWeather(cityName);
  }
}
