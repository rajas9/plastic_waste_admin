import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_1/centerlist.dart';
import 'package:web_1/constraints.dart';
import 'package:web_1/plastictypelist.dart';

import 'package:web_1/statuscard.dart';
import 'package:web_1/topbar.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  List<dynamic>? items = [];
  List<dynamic>? items2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: Drawer(),
        body: SingleChildScrollView(
      child: Column(
        children: [
          const Topbar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection("demodata2")
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    if (!snapshot.hasData || snapshot.data == null) {
                      // Handle null value
                      return Container(
                      margin: const EdgeInsets.all(20),
                      
                      child: const CircularProgressIndicator());
                    } else {
                      // Access data

                      items = snapshot.data?.docs;
                      List<int> total = [0, 0];
                      var n = items?.length;

                      for (var i = 0; i < n!; i++) {
                        total[0] =
                            total[0] + int.parse(items![i]["quantity"]);
                        total[1] = total[1] + int.parse(items![i]["reward"]);
                      }

                      return Row(
                        
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StatusCard(title: "quantity", value: total[0]),
                          const SizedBox(
                            width: 20,
                          ),
                          StatusCard(
                            title: "Reward",
                            value: total[1],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const StatusCard(
                            title: "center",
                            value: 5,
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 350,
            width: 640,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(137, 181, 162, 0.56),
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: Offset(0, -2))
            ], borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: StreamBuilder<Object>(
                stream: FirebaseFirestore.instance
                    .collection("demodata2")
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
                    List<int> ptype = [0, 0, 0, 0, 0, 0, 0];
                    var j = 0;

                    for (var i = 0; i < items2!.length; i++) {
                      j = int.parse(items2![i]["p_type"]);
                      ptype[j] = ptype[j] + 1;
                    }

                    return ListView.builder(
                      
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: const Icon(Icons.list_alt_outlined),
                              trailing: Text(
                                "count: ${ptype[index]}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: primary),
                              ),
                              title: Text("Plastic Type ${index + 1}"));
                        });
                  }
                }),
          ),
          const SizedBox(height: 20,),
          InkWell
          (
            onTap: () {
                    Navigator.push(context, 
                              new MaterialPageRoute(
                              builder: (context)=> new centerlist(),));
                  },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: primaryLight,
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Text("center details here",
              style: TextStyle(
                color: Colors.black87
              ),) 
            ),
          )
        ],
      ),
    ));
  }
}
