import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:web_1/navdrawer.dart';
import 'package:web_1/screens/dashboard.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        style:TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 2,),
        child: Text("here"),
      onPressed: () {navdrawer();},
      ),
    );
  }
}
