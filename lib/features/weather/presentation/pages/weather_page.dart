import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_md/core/const/app_constants.dart';
import 'package:weather_app_md/core/style/AppColors.dart';
import 'package:weather_app_md/core/utils/network_utils/network/api_endpoints.dart';
import 'package:weather_app_md/core/utils/ui_utils/ui_utils.dart';
import 'package:weather_app_md/core/widgets/primary_button.dart';
import 'package:weather_app_md/core/widgets/primary_form_field.dart';
import 'package:weather_app_md/core/widgets/primary_loading_indicator.dart';

import '../../domain/entities/weather.dart';
import '../state_manager/weather_provider.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  TextEditingController cityCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<WeatherProvider>(
          builder: (_, prv, __) {
            return Column(
              children: [
                PrimaryFormField(
                  controller: cityCtrl,
                  label: 'Enter City Name',
                ),
                const SizedBox(height: 10),
                PrimaryButton(
                  text: 'Get Weather',
                  isLoading: prv.loading,
                  backgroundColor: AppColors.mainColor,
                  onPressed: () {
                    if (cityCtrl.text.isEmpty) {
                      UiUtils.showErrorMessage(message: 'Enter the city');
                      return;
                    }
                    prv.fetchWeather(cityCtrl.text);
                  },
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 16),
                if (prv.loading)
                  const PrimaryLoadingIndicator()
                else if (prv.errorMessage != null)
                  Text(prv.errorMessage!)
                else if (prv.weather != null)
                    WeatherDisplay(weather: prv.weather!)
                else
                  const Text('Enter a city name'),
              ],
            );
          }
        ),
      ),
    );
  }
}

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(weather.cityName, style: const TextStyle(fontSize: 20)),
        Text('${weather.temperature} °C'),
        Text(weather.description),
        Image.network('${ApiEndpoints.baseAssetUrl}${weather.icon}${ApiEndpoints.baseAssetUrlFooter}'),
      ],
    );
  }
}
