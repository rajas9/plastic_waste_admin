import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:web_1/widgets/statuscard.dart';

class statuscardlist extends StatefulWidget {
  const statuscardlist({super.key});

  @override
  State<statuscardlist> createState() => _statuscardlistState();
}

class _statuscardlistState extends State<statuscardlist> {
  List<dynamic>? items = [];
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StreamBuilder<Object>(
                  stream: FirebaseFirestore.instance
                      .collection("pwdata")
                      .snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (!snapshot.hasData || snapshot.data == null) {
                      // Handle null value
                      return Container(
                          margin: const EdgeInsets.all(20),
                          child: const CircularProgressIndicator());
                    } else {
                      // Access data

                      /*ist<Map<String,dynamic>> items= snapshot.data.docs as List<Map<String,dynamic>>;*/

                      items = snapshot.data?.docs;
                      List<double> total = [0, 0];
                      var n = items?.length;

                      for (var i = 0; i < n!; i++) {
                        total[0] =
                            total[0] + double.parse(items![i]["quantity"]);
                        total[1] = total[1] + double.parse(items![i]["reward"]);
                      }

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StatusCard(
                              title: "Quantity",
                              value: total[0].round()), //total[0]),
                          const SizedBox(
                            width: 20,
                          ),
                          StatusCard(
                            title: "Reward",
                            value: total[1].round(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const StatusCard(
                            title: "Center",
                            value: 5,
                          ),
                        ],
                      );
                    }
                  }),
            ],
          );
  }
}
