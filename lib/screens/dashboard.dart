

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:web_1/screens/centerlist.dart';
import 'package:web_1/constraints.dart';
import 'package:web_1/widgets/plastictypelist.dart';

import 'package:web_1/widgets/statuscard.dart';
import 'package:web_1/widgets/topbar.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  List<dynamic>? items = [];
  List<dynamic>? items2 = [];
  List<Map>? piemap=[];
  List<String> pname=['PETE','HDPE','PVC','LDPE','PP','PS','OTHER'];
  List<dynamic> pperc=[0,0,0,0,0,0,0];

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
                      .collection("pwdata")
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
                          StatusCard(title: "Quantity", value: total[0]),
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
                            title: "Center",
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
                    List<int> ptype = [0, 0, 0, 0, 0, 0, 0];
                    double j = 0;
                    //print(items2![0]["p_type"]);
                    for (var i = 0; i < items2!.length; i++) {
                      if(items2![i]["p_type"]=='PETE'){
                        ptype[0] = ptype[0] + 1;
                      }else if(items2![i]["p_type"]=='HDPE'){
                        ptype[1] = ptype[1] + 1;

                      }
                      else if(items2![i]["p_type"]=='PVC'){
                        ptype[2] = ptype[2] + 1;

                      }
                      else if(items2![i]["p_type"]=='LDPE'){
                        ptype[3] = ptype[3] + 1;

                      }
                      else if(items2![i]["p_type"]=='PP'){
                        ptype[4] = ptype[4] + 1;

                      }
                      else if(items2![i]["p_type"]=='PS'){
                        ptype[5] = ptype[5] + 1;

                      }
                      else{
                        ptype[6] = ptype[6] + 1;
                      }
                    }

                    //calculating percentage
                    for (var i = 0; i < 7; i++) {
                      j=(ptype[i]/7)*100;
                      pperc[i]=double.parse((j).toStringAsFixed(2));
                    }

                    //adding to map
                    for (var i = 0; i < 7; i++) {
                      piemap!.add(
                        {
                          "ptype":pname[i],
                          "percentage":pperc[i]
                        }
                      );
                    }

                    return _buildDefaultPieChart(piemap!);
                    /*
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
                  */}
                }),
          ),
          const SizedBox(height: 20,),
          InkWell
          (
            onTap: () {
                    Navigator.push(context, 
                               MaterialPageRoute(
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


SfCircularChart _buildDefaultPieChart(List<Map> value) {
    return SfCircularChart(
      title: ChartTitle(text:  'Plastic waste by its types'),
      legend: Legend(isVisible: true),
      series: _getDefaultPieSeries(value),
    );
  }

  /// Returns the pie series.
  List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries(List<Map> value) {
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '10%',
          dataSource: [
           
            ChartSampleData(value[0]['ptype'],value[0]['percentage'],"${value[0]['ptype']}\n${value[0]['percentage']}"),
            ChartSampleData(value[1]['ptype'],value[1]['percentage'],"${value[1]['ptype']}\n${value[1]['percentage']}"),
            ChartSampleData(value[2]['ptype'],value[2]['percentage'],"${value[2]['ptype']}\n${value[2]['percentage']}"),
            ChartSampleData(value[3]['ptype'],value[3]['percentage'],"${value[3]['ptype']}\n${value[3]['percentage']}"),
            ChartSampleData(value[4]['ptype'],value[4]['percentage'],"${value[4]['ptype']}\n${value[4]['percentage']}"),
            ChartSampleData(value[5]['ptype'],value[5]['percentage'],"${value[5]['ptype']}\n${value[5]['percentage']}"),
            ChartSampleData(value[6]['ptype'],value[6]['percentage'],"${value[6]['ptype']}\n${value[6]['percentage']}"),
          ],
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }
  
  class ChartSampleData {
        ChartSampleData(this.x, this.y, this.text);
        final String x;
        final double y;
        final String text;
    }

  
