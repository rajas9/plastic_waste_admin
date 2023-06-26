// this page not in sidebar. made for experiment purpose



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_1/constraints.dart';

// String dropdownvalue = '102';

class centerchart extends StatefulWidget {
  const centerchart({super.key});

  @override
  State<centerchart> createState() => _centerchartState();
}

class _centerchartState extends State<centerchart> {
  bool containerVisible = false;
  String dropdownvalue = 'all';

  void toggleContainerVisibility() {
    setState(() {
      containerVisible = !containerVisible;
    });
  }

  void dropdownval(String newValue) {
    setState(() {
      dropdownvalue = newValue;
    });
  }

  void updatepiechart(){
    
  }

  // List of items in our dropdown menu
  var ite = [
    '102',
    '101',
    '103',
    '104',
    '105',
  ];

  List<dynamic>? items = [];
  List<dynamic>? items2 = [];
  List<Map>? piemap = [];
  List<String> pname = ['PETE', 'HDPE', 'PVC', 'LDPE', 'PP', 'PS', 'OTHER'];
  List<dynamic> pperc = [0, 0, 0, 0, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: ite.map((String opt) {
                return DropdownMenuItem(
                  value: opt,
                  child: Text(opt),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                dropdownval(newValue!);
                print(dropdownvalue);
              },
            ),
            ElevatedButton(
              child: Text('Toggle Container'),
              onPressed: toggleContainerVisibility,
            ),
            if (containerVisible)
              // Container(
              //   color: Colors.blue,
              //   child: Text("$dropdownvalue"),)
              Container(
                height: 350,
                width: 640,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(137, 181, 162, 0.56),
                          blurRadius: 16,
                          spreadRadius: 0,
                          offset: Offset(0, -2))
                    ],
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
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
                          if (dropdownvalue == "all") {
                            if (items2![i]["p_type"] == 'PETE') {
                              ptype[0] = ptype[0] + 1;
                            } else if (items2![i]["p_type"] == 'HDPE') {
                              ptype[1] = ptype[1] + 1;
                            } else if (items2![i]["p_type"] == 'PVC') {
                              ptype[2] = ptype[2] + 1;
                            } else if (items2![i]["p_type"] == 'LDPE') {
                              ptype[3] = ptype[3] + 1;
                            } else if (items2![i]["p_type"] == 'PP') {
                              ptype[4] = ptype[4] + 1;
                            } else if (items2![i]["p_type"] == 'PS') {
                              ptype[5] = ptype[5] + 1;
                            } else {
                              ptype[6] = ptype[6] + 1;
                            }
                          } else {
                            if (items2![i]["p_type"] == 'PETE' &&
                                items2![i]["center"] == dropdownvalue) {
                              ptype[0] = ptype[0] + 1;
                            } else if (items2![i]["p_type"] == 'HDPE' &&
                                items2![i]["center"] == dropdownvalue) {
                              ptype[1] = ptype[1] + 1;
                            } else if (items2![i]["p_type"] == 'PVC' &&
                                items2![i]["center"] == dropdownvalue) {
                              ptype[2] = ptype[2] + 1;
                            } else if (items2![i]["p_type"] == 'LDPE' &&
                                items2![i]["center"] == dropdownvalue) {
                              ptype[3] = ptype[3] + 1;
                            } else if (items2![i]["p_type"] == 'PP' &&
                                items2![i]["center"] == dropdownvalue) {
                              ptype[4] = ptype[4] + 1;
                            } else if (items2![i]["p_type"] == 'PS' &&
                                items2![i]["center"] == dropdownvalue) {
                              ptype[5] = ptype[5] + 1;
                            } else if (items2![i]["center"] == dropdownvalue) {
                              ptype[6] = ptype[6] + 1;
                            }
                          }
                        }

                        //calculating percentage
                        for (var i = 0; i < 7; i++) {
                          j = (ptype[i] / items2!.length) * 100;
                          pperc[i] = double.parse((j).toStringAsFixed(2));
                        }

                        //adding to map
                        for (var i = 0; i < 7; i++) {
                          piemap!
                              .add({"ptype": pname[i], "percentage": pperc[i]});
                        }

                        return Column(
                          children: [
                            // DropdownButton(
                            //   // Initial Value
                            //   value: dropdownvalue,

                            //   // Down Arrow Icon
                            //   icon: const Icon(Icons.keyboard_arrow_down),

                            //   // Array list of items
                            //   items: ite.map((String opt) {
                            //     return DropdownMenuItem(
                            //       value: opt,
                            //       child: Text(opt),
                            //     );
                            //   }).toList(),
                            //   // After selecting the desired option,it will
                            //   // change button value to selected value
                            //   onChanged: (String? newValue) {
                            //     setState(() {
                            //       dropdownvalue = newValue!;
                            //     });
                            //     print(dropdownvalue);
                            //   },
                            // ),
                            _buildDefaultPieChart(piemap!),
                          ],
                        );
                      }
                    }),
              ),
          ],
        ),
      ),
    );
  }
}





SfCircularChart _buildDefaultPieChart(List<Map> value) {
  return SfCircularChart(
    title: ChartTitle(text: 'Plastic waste by its types'),
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
          ChartSampleData(value[0]['ptype'], value[0]['percentage'],
              "${value[0]['ptype']}\n${value[0]['percentage']}"),
          ChartSampleData(value[1]['ptype'], value[1]['percentage'],
              "${value[1]['ptype']}\n${value[1]['percentage']}"),
          ChartSampleData(value[2]['ptype'], value[2]['percentage'],
              "${value[2]['ptype']}\n${value[2]['percentage']}"),
          ChartSampleData(value[3]['ptype'], value[3]['percentage'],
              "${value[3]['ptype']}\n${value[3]['percentage']}"),
          ChartSampleData(value[4]['ptype'], value[4]['percentage'],
              "${value[4]['ptype']}\n${value[4]['percentage']}"),
          ChartSampleData(value[5]['ptype'], value[5]['percentage'],
              "${value[5]['ptype']}\n${value[5]['percentage']}"),
          ChartSampleData(value[6]['ptype'], value[6]['percentage'],
              "${value[6]['ptype']}\n${value[6]['percentage']}"),
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
