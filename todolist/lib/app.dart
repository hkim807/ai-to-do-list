import 'package:flutter/material.dart';
import 'design_system/theme/app_theme.dart';
import 'screens/start_screen.dart';

class App extends StatefulWidget {
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode _mode = ThemeMode.system; // toggle to test dark mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      themeMode: _mode,
      home: const StartScreen(),
    );
  }
}
