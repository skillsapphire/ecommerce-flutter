import 'package:flutter/material.dart';
import 'package:listing_app/constants/constants.dart';
import 'package:listing_app/services/item_category_service.dart';
import 'package:listing_app/services/item_service.dart';
import 'package:listing_app/services/user_service.dart';
import 'package:listing_app/views/Welcome/welcome_screen.dart';
import 'package:listing_app/views/overview/home.dart';
import 'package:get_it/get_it.dart';
import 'package:listing_app/views/splash/splash_screen.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => ItemService());
  GetIt.I.registerLazySingleton(() => ItemCategoryService());
  GetIt.I.registerLazySingleton(() => UserService());
}

void main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoCity App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: HomeScreen()
      routes: {
      "/welcome": (ctx) => WelcomeScreen(),
      "/home": (ctx) => HomeScreen(menu: "Doctors"),
     //   "/": (ctx) => EditLocation(),
      "/": (ctx) => SplashScreen(),
    },
    );
  }
}
