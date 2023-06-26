import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController= TextEditingController();
  final passwardController= TextEditingController();




  Future signin() async{
    
    
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwardController.text
    );
    }on FirebaseAuthException catch (e) {
      print(e);
      if(e=='wrong-password'){
        
      }
    }
    
  }
  
  List<Map> dd=[];

  Future<List<Map<String, dynamic>>> getdata() async{
    var admin=await FirebaseFirestore.instance.collection("dataad").get();
    final admdata = admin.docs.map((doc) => doc.data()).toList();
    return admdata;
  }
  //var admin=FirebaseFirestore.instance.collection("dataad").doc("6isOXz5YoGCeZ226oKsQ");

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body:SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text("${getdata()}"),
              Text('Login',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(

                    hintText: 'Email',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    fillColor: Colors.white,
                    filled: true,

                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextField(
                  obscureText: true,
                  controller: passwardController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 20,),


              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(top: 20,bottom: 20,left: 30,right: 30)
                ),
                  onPressed: (){

                 signin();
              }, child: Text('login'))
            ],
          ),
        ),
      ),
    );
  }
}