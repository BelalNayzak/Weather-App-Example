import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/di/injection.dart' as di;
import 'package:weather_app_md/core/const/app_constants.dart';
import 'package:weather_app_md/core/services/navigation_services.dart';
import 'features/weather/presentation/pages/weather_page.dart';
import 'features/weather/presentation/state_manager/weather_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherProvider(getWeather: di.sl()),
        ),
        // ...
      ],
      child: MaterialApp(
        initialRoute: NavigationServices.homeRoute,
        routes: {
          NavigationServices.homeRoute: (_) => WeatherPage(),
        },
        builder: BotToastInit(),
        navigatorKey: NavigationServices.navKey,
        title: AppConstants.appName,
      ),
    );
  }
}