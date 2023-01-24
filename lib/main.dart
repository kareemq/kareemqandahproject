import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:kareem_qandah/signup.dart';
import 'package:kareem_qandah/about.dart';
import 'package:kareem_qandah/drawer.dart';
import 'package:kareem_qandah/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'read.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp (debugShowCheckedModeBanner: false,home: Home(Home: null,),
    );
  }
}

