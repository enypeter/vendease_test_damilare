import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/app_colors.dart';
import 'views/home_view/bottom_nav.dart';

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _enablePlatformOverrideForDesktop();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) async {
      runApp(
        const MyApp(),
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vendease Test',
      theme: ThemeData(
          primaryColor: PRIMARY_COLOR,
          primarySwatch: Colors.blue,
          fontFamily: 'Libre'),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Center(
        child: Text(
          'VENDEASE',
          style: TextStyle(
              color: WHITE,
              fontSize: 35,
              letterSpacing: 1.3,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  initState() {
    openApp();
    super.initState();
  }

  openApp() {
    Future.delayed(const Duration(seconds: 2),
        () => Get.offAll(() => const HomeNavigationBar()));
  }
}
