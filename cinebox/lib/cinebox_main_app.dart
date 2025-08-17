import 'package:cinebox/ui/core/themes/theme.dart';
import 'package:cinebox/ui/home/home_screen.dart';
import 'package:cinebox/ui/login/login_screen.dart';
import 'package:cinebox/ui/movie_details/commands/movie_details_screen.dart';
import 'package:cinebox/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CineBox",
      theme: AppTheme.theme,
      navigatorKey: navKey,
      routes: {
        "/": (_) => SplashScreen(),
        "/login": (_) => LoginScreen(),
        "/home": (_) => HomeScreen(),
        "/movie_details": (_) => MovieDetailsScreen(),
      },
    );
  }
}
