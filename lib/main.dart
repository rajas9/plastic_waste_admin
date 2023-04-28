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
      apiKey: "AIzaSyAMrd18G8YgGpK2wfOe3ZGVwtMsgbQNoEU",
      appId: "1:608732425209:web:cae3dafca01ba234ddeb28",
      messagingSenderId: "608732425209", 
      projectId: "plastic-waste-541ca")
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


