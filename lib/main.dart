import 'package:flutter/material.dart';
import 'package:flutter_home_work7/detail_page.dart';
import 'package:flutter_home_work7/error_page.dart';
import 'package:flutter_home_work7/home_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => NotFoundPage());
      },
      routes: {
        '/': (BuildContext context) => HomePage(),
        // '/detail': (BuildContext context) => DetailPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(),
    );
  }
}
