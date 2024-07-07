import 'package:weather_app_md/core/utils/network_utils/network/api_endpoints.dart';

import '../../../../core/utils/network_utils/network/api_client.dart';
import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient apiClient;

  WeatherRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<WeatherModel> getWeather(String cityName) async {
    final response = await apiClient.get('$cityName${ApiEndpoints.baseUrlFooter}');
    return WeatherModel.fromJson(response);
  }
}
