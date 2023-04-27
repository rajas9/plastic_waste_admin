import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web_1/constraints.dart';
import 'package:web_1/homepage.dart';
import 'package:web_1/widgets/plastictypelist.dart';
import 'package:web_1/screens/dashboard.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCBwhyNzd2yhIBEwL4LZuuFu0KwlF55xKg",
      appId: "1:368856123001:web:8e8af98597c43a29a036a8", 
      messagingSenderId: "368856123001", 
      projectId: "web1-78c64")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {   
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
          
          primaryColor: primary,
          textTheme: TextTheme().apply(bodyColor: textColor),
          backgroundColor: Colors.yellow),
      home: dashboard(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}


