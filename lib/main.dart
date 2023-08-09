import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/components/constants.dart';
import 'src/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        fontFamily: 'roboto',
        primarySwatch: kBurntOrange,
      ),
      initialRoute: RouteController.getHomeRoute(),
      getPages: RouteController.routes,
    );
  }
}
