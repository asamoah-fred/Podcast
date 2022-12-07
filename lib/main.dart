import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/core/view_models/podcast_provider.dart';
import 'package:provider_demo/pages/sharedWidgets/navigation.dart';
import 'package:provider_demo/utils/custom_theme.dart';
import 'core/services/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PodCastProvider>(
          create: (context) => PodCastProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'myPodcast',
        theme: customLightTheme(context),
        darkTheme: customDarkTheme(context),
        themeMode: ThemeMode.system,
        home: Navigation(),
      ),
    );
  }
}
