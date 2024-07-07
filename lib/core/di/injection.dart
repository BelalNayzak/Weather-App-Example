import 'package:get_it/get_it.dart';
import 'package:weather_app_md/core/utils/network_utils/network/api_client.dart';
import 'package:weather_app_md/features/weather/data/datasources/weather_datasource.dart';
import 'package:weather_app_md/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_app_md/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app_md/features/weather/presentation/state_manager/weather_provider.dart';
import 'package:http/http.dart' as http;

import '../../features/weather/domain/use_cases/get_weather.dart';
import '../utils/network_utils/network/api_endpoints.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // usecase
  sl.registerFactory(() => GetWeather(repository: sl()));

  // provider
  sl.registerFactory(() => WeatherProvider(getWeather: sl()));

  // repository
  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(remoteDataSource: sl()));

  // core / network
  sl.registerLazySingleton<ApiClient>(() => ApiClientImpl(
    baseUrl: ApiEndpoints.baseUrl,
    httpClient: sl(),
  ));

  // remote datasource
  sl.registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(apiClient: sl()));

  // httpClient
  sl.registerLazySingleton<http.Client>(() => http.Client());

}