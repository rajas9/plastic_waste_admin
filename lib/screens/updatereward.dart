import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:web_1/screens/dashboard.dart';

import '../constraints.dart';

class UpdateReward extends StatefulWidget {
  const UpdateReward({super.key});

  @override
  State<UpdateReward> createState() => _UpdateRewardState();
}

class _UpdateRewardState extends State<UpdateReward> {
  Map<dynamic, dynamic> reward = {};
  final petecontroller = TextEditingController();
  final hdpecontroller = TextEditingController();
  final pvccontroller = TextEditingController();
  final ppcontroller = TextEditingController();
  final pscontroller = TextEditingController();
  final ldpecontroller = TextEditingController();
  final othercontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const dashboard(),
                        ));
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      // margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "go back",
                        style: TextStyle(color: Colors.black87),
                      )),
                ),
                //SizedBox(height: 20,width: 400,),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 100),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "reward data",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 600,
                  width: 400,
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  //padding: const EdgeInsets.fromLTRB(200, 200, 200,300),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(137, 181, 162, 0.56),
                            blurRadius: 16,
                            spreadRadius: 0,
                            offset: Offset(0, -2))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("rewarddata")
                          .doc("PihOYjcUUWPdmPjUU2MW")
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData || snapshot.data == null) {
                          // Handle null value
                          return Container(
                              margin: const EdgeInsets.all(150),
                              child: const CircularProgressIndicator());
                        } else {
                          // Access data
                          reward = snapshot.data?.data();

                          //return Text("${reward["PVC"]}");
                          return Container(
                            height: 100,
                            width: 100,
                            child: ListView(
                              // padding: EdgeInsets.all(8),

                              children: <Widget>[
                                //Text("${reward}"),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: primaryLight,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("PETE -\t${reward["PETE"]}"),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: primaryLight,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("HDPE -\t${reward["HDPE"]}"),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: primaryLight,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("PVC -\t${reward["PVC"]}"),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: primaryLight,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("LDPE -\t${reward["LDPE"]}"),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: primaryLight,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("PP -\t${reward["PP"]}"),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: primaryLight,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("PS -\t${reward["PS"]}"),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 5),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: primaryLight,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text("OTHER -\t${reward["OTHER"]}"),
                                )
                              ],
                            ),
                          );
                        }
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  //height: 670,
                  width: 500,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(137, 181, 162, 0.56),
                            blurRadius: 16,
                            spreadRadius: 0,
                            offset: Offset(0, -2))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  // child: Container(
                  //   height: 60,
                  //   width: 240,
                  //   color: Colors.amberAccent,
                  //   // child: Text("here"),
                  //   child: TextField(
                  //     controller: emailcontroller,
                  //     cursorColor: Colors.white,
                  //     textInputAction: TextInputAction.next,
                  //     decoration: InputDecoration(labelText: 'Enter PETE Rate'),
                  //   ),
                  // ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: petecontroller,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter PETE Rate'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: hdpecontroller,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter HDPE Rate'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: pvccontroller,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter PVC Rate'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: ldpecontroller,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter LDPE Rate'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: ppcontroller,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter PP Rate'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: pscontroller,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter PS Rate'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: othercontroller,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter OTHER plastic Rate'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  FirebaseFirestore.instance
                                      .collection("rewarddata")
                                      .doc("PihOYjcUUWPdmPjUU2MW")
                                      .update({
                                    'HDPE': hdpecontroller.text,
                                    'LDPE': ldpecontroller.text,
                                    'OTHER': othercontroller.text,
                                    'PETE': petecontroller.text,
                                    'PP': ppcontroller.text,
                                    'PS': pscontroller.text,
                                    'PVC': pvccontroller.text,
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
