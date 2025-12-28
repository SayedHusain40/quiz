import 'package:quiz/quiz_app.dart';
import 'package:quiz/routing/app_routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.startScreen:
        return MaterialPageRoute(builder: (_) => const QuizApp());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route found ${setting.name}')),
          ),
        );
    }
  }
}
