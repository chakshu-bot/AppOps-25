import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:no_api_shopping_app/background.dart';
import 'package:no_api_shopping_app/splash.dart';
import 'package:no_api_shopping_app/vegetables.dart';
//import 'package:flutter/rendering.dart';

void main() {
  //debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Background(
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(20, 50)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Vegetables(),
                ),
              );
            },
            child: const Text(
              'Start Shopping',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
