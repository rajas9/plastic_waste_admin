import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:web_1/constraints.dart';
import 'package:web_1/screens/dashboard.dart';

class centerlist extends StatefulWidget {
  const centerlist({Key? key}) : super(key: key);

  @override
  State<centerlist> createState() => _centerlistState();
}

class _centerlistState extends State<centerlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 200, 200),
            child: InkWell(
              onTap: () {
                    Navigator.push(context, 
                              new MaterialPageRoute(
                              builder: (context)=> new dashboard(),));
                  },
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: primaryLight,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text("go back",
                  style: TextStyle(
                    color: Colors.black87
                  ),)
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(50),
                //color: Color.fromARGB(255, 250, 233, 173),
                child: Text("center stats will be here"),
              ),
            ],
          )
        ],
      )
    );
  }
}