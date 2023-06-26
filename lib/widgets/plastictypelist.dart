import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// this page not in sidebar. related to older version
class ptlist extends StatefulWidget {
  const ptlist({Key? key}) : super(key: key);

  @override
  State<ptlist> createState() => _ptlistState();
}

class _ptlistState extends State<ptlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 400,
        child: Center(
          
          child: StreamBuilder<Object>(
            stream: FirebaseFirestore.instance
                      .collection("pwdata")
                      .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<dynamic> items = snapshot.data?.docs;
              List<int> ptype= [0,0,0,0,0,0,0];
              var j=0;

              for (var i = 0; i < items.length; i++) {
                      j=int.parse(items[i]["p_type"]);
                      ptype[j] = ptype[j] + 1;
                      
                      
                    }



              return ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const Icon(Icons.list),
                        trailing: Text(
                          "count: ${ptype[index]}",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        title: Text("Plastic Type ${index+1}"));
                  });
            }
          ),
        ),
      ),
    );
  }
}