
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopee1/controller/home_controller.dart';
import 'package:shopee1/firebase_options.dart';
import 'package:shopee1/pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}


