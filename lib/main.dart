// ignore_for_file: avoid_print

import 'package:firebase_app/screens/home/home_page_screen.dart';
import 'package:firebase_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:firebase_app/shared/network/local/cache_helper.dart';
import 'package:firebase_app/shared/network/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            ':::::::::::::::::::::::::::::::::::: User is currently signed out! ::::::::::::::::::::::::::::::::::::');
      } else {
        print(
            ':::::::::::::::::::::::::::::::::::: User is signed in! ::::::::::::::::::::::::::::::::::::');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const OnBoardingScreen()
          : const HomePageScreen(),
    );
  }
}
