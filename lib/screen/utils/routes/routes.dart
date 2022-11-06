

import 'package:admin_ambient/screen/autentication/login/layout/login_screen.dart';
import 'package:admin_ambient/screen/autentication/logup/layout/logup_screen.dart';
import 'package:admin_ambient/screen/home/layouts/home_screen.dart';
import 'package:admin_ambient/screen/splash/layouts/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const SplashScreen(),
  '/login': (BuildContext context) => const LoginScreen(),
  '/logup': (BuildContext context) => const LogUpScreen(),
  '/home': (BuildContext context) => const HomeScreen()
};
