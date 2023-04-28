import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<dynamic>? items2 = [];
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
                child: Text("Plastic Waste Collection by centers",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color:primary),
              ),
              ),
              SizedBox(height: 20,),
              Container(
                
                //color: Color.fromARGB(255, 250, 233, 173),
                child: Container(
            height: 200,
            width: 640,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(137, 181, 162, 0.56),
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: Offset(0, -2))
            ], borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("pwdata")
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    // Handle null value
                    return Container(
                      margin: const EdgeInsets.all(200),
                      
                      child: const CircularProgressIndicator());
                  } else {
                    // Access data

                    items2 = snapshot.data?.docs;
                    List<int> pcenter = [0, 0, 0, 0, 0];
                    double j = 0;
                    //print(items2![0]["p_type"]);
                    for (var i = 0; i < items2!.length; i++) {
                      if(items2![i]["center"]=='101'){
                        pcenter[0] = pcenter[0] + 1;
                      }else if(items2![i]["center"]=='102'){
                        pcenter[1] = pcenter[1] + 1;

                      }
                      else if(items2![i]["center"]=='103'){
                        pcenter[2] = pcenter[2] + 1;

                      }
                      else if(items2![i]["center"]=='104'){
                        pcenter[3] = pcenter[3] + 1;

                      }
                      else if(items2![i]["center"]=='105'){
                        pcenter[4] = pcenter[4] + 1;

                      }
                      
                    }

                    
                    

                    
                    
                    return ListView.builder(
                      
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: const Icon(Icons.list_alt_outlined),
                              trailing: Text(
                                "count: ${pcenter[index]}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: primary),
                              ),
                              title: Text("center ${index + 1}"));
                        });
                  }
                }),
          ),
              ),
            ],
          )
        ],
      )
    );
  }
}