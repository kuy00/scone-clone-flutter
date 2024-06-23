import 'package:flutter/material.dart';
import 'package:flutter_study/routes.dart';
import 'package:jiffy/jiffy.dart';

void main() async {
  await Jiffy.setLocale('ko');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'scone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1773FC)),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          modalBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      routerConfig: routes,
      // home: const HomePage(),
    );
  }
}
