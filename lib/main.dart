import 'package:blocmap/bloc/loginBloc/login_bloc.dart';
import 'package:blocmap/route_generator.dart';
import 'package:blocmap/screens/LoginPage.dart';
import 'package:blocmap/screens/MapScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/routeBloc/route_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: routeGenerator.generateRoute
    );
  }
}
