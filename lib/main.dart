import 'package:flutter/material.dart';
import 'splash screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static ValueNotifier<String> languageNotifier = ValueNotifier<String>('English');
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);
    
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            // Remove the debug banner
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.blue),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
           home: SplashScreen(),
          );
        });
  }
}
