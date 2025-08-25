import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:strangerschat/router/routes.dart';
import 'package:strangerschat/utils/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strangers Chat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: _themeMode,
      builder: EasyLoading.init(),
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Strangers Chat'),
          actions: [
            IconButton(
              icon: Icon(_themeMode == ThemeMode.dark
                  ? Icons.wb_sunny
                  : Icons.nightlight_round),
              onPressed: _toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}
