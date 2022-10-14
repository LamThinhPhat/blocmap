

import 'package:blocmap/bloc/loginBloc/login_bloc.dart';
import 'package:blocmap/bloc/routeBloc/route_bloc.dart';
import 'package:blocmap/screens/LoginPage.dart';
import 'package:blocmap/screens/MapScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class routeGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    final args = settings.arguments;
    switch(settings.name){
      case '/' :
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
            child: LoginPage(),
          );
        });
      case '/map-screen':
        return MaterialPageRoute(builder: (context) {
          return BlocProvider<RouteBloc>(
            create: (context) => RouteBloc(),
            child: MapScreen(),
          );
        });
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute()
  {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Center(
            child: Text("Error"),
          ),
        ),
      );
    });
  }
}
