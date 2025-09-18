import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/core/routes/routes_name.dart';
import 'package:news_clean_architecture/feature/home/presentation/pages/addPost.dart';
import 'package:news_clean_architecture/feature/splash/presentation/manager/manage_splash_screen_cubit.dart';

import '../../feature/home/presentation/pages/home.dart';
import '../../feature/splash/presentation/pages/splashScreen.dart';

class ManageRoutesSetting {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => ManageSplashScreenCubit(),
                child: Splashscreen(),
              ),
        );
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => const Home());

      case RoutesName.addDeleteUpdate:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        return MaterialPageRoute(settings: settings, builder: (_) => AddPost());

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('No route found'))),
        );
    }
  }
}
