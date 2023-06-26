// this page is in the sidebar




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_1/constraints.dart';
import 'package:web_1/screens/dashboard.dart';

class barchacenter extends StatefulWidget {
  const barchacenter({super.key});

  @override
  State<barchacenter> createState() => _barchacenterState();
}

class _barchacenterState extends State<barchacenter> {
  List<dynamic>? items2 = [];
  List<Map>? piemap = [];
  List<String> pname = ['PETE', 'HDPE', 'PVC', 'LDPE', 'PP', 'PS', 'OTHER'];
  //List<dynamic> center_percentage = [0, 0, 0, 0, 0];
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        header: 'details',
        format: 'point.y',
        canShowMarker: false);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          // Container(
          //   child: Text(
          //     "Center Data",
          //     style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.w400,
          //         color: primary),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              //color: Color.fromARGB(255, 250, 233, 173),
              child: Container(
                height: 400,
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
                        double totalquantity=0;
                        List<double> ptype = [0, 0, 0, 0, 0, 0, 0];
                        List<dynamic> pperc = [0, 0, 0, 0, 0, 0, 0];
                        double j = 0;
                        int entriesLength = items2!.length;
                        //print(items2![0]["p_type"]);
                        // for (var i = 0; i < entriesLength; i++) {
                        //   if (items2![i]["center"] == "101") {
                        //     totalquantity+=double.parse(items2![i]["quantity"]);
                        //     if (items2![i]["p_type"] == 'PETE') {
                        //       ptype[0] = ptype[0] + double.parse(items2![i]["quantity"]);
                        //     } else if (items2![i]["p_type"] == 'HDPE') {
                        //       ptype[1] = ptype[1] + double.parse(items2![i]["quantity"]);
                        //     } else if (items2![i]["p_type"] == 'PVC') {
                        //       ptype[2] = ptype[2] + double.parse(items2![i]["quantity"]);
                        //     } else if (items2![i]["p_type"] == 'LDPE') {
                        //       ptype[3] = ptype[3] + double.parse(items2![i]["quantity"]);
                        //     } else if (items2![i]["p_type"] == 'PP') {
                        //       ptype[4] = ptype[4] + double.parse(items2![i]["quantity"]);
                        //     } else if (items2![i]["p_type"] == 'PS') {
                        //       ptype[5] = ptype[5] + double.parse(items2![i]["quantity"]);
                        //     } else {
                        //       ptype[6] = ptype[6] + double.parse(items2![i]["quantity"]);
                        //     }
                        //   }
                        // }
          
                        for (var i = 0; i < entriesLength; i++) {
                          
                            totalquantity+=double.parse(items2![i]["quantity"]);
                            if (items2![i]["p_type"] == 'PETE') {
                              ptype[0] = ptype[0] + double.parse(items2![i]["quantity"]);
                            } else if (items2![i]["p_type"] == 'HDPE') {
                              ptype[1] = ptype[1] + double.parse(items2![i]["quantity"]);
                            } else if (items2![i]["p_type"] == 'PVC') {
                              ptype[2] = ptype[2] + double.parse(items2![i]["quantity"]);
                            } else if (items2![i]["p_type"] == 'LDPE') {
                              ptype[3] = ptype[3] + double.parse(items2![i]["quantity"]);
                            } else if (items2![i]["p_type"] == 'PP') {
                              ptype[4] = ptype[4] + double.parse(items2![i]["quantity"]);
                            } else if (items2![i]["p_type"] == 'PS') {
                              ptype[5] = ptype[5] + double.parse(items2![i]["quantity"]);
                            } else {
                              ptype[6] = ptype[6] + double.parse(items2![i]["quantity"]);
                            }
                          
                        }
          
                        //calculating percentage
                  for (var i = 0; i < 7; i++) {
                    j = (ptype[i] / totalquantity) * 100;
                    pperc[i] = double.parse((j).toStringAsFixed(2));
                  }
          
                  //adding to map
                  for (var i = 0; i < 7; i++) {
                    piemap!.add({"ptype": pname[i], "percentage": pperc[i]});
                  }
                        return _buildDefaultColumnChart(
                            piemap!, _tooltipBehavior);
          
                        /*
                  return ListView.builder(
                    
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: const Icon(Icons.list_alt_outlined),
                            trailing: Text(
                              "count: ${center_percentage[index]}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w100,
                                  color: primary),
                            ),
                            title: Text("center ${index + 1}"));
                      });*/
                      }
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

SfCartesianChart _buildDefaultColumnChart(
    List<Map> value, TooltipBehavior _tooltipBehavior) {
  //var _tooltipBehavior;
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: ChartTitle(text: 'Plastic Waste Collection by this center'),
    primaryXAxis: CategoryAxis(
      majorGridLines: const MajorGridLines(width: 0),
    ),
    primaryYAxis: NumericAxis(
        axisLine: const AxisLine(width: 0),
        labelFormat: '{value}%',
        majorTickLines: const MajorTickLines(size: 0)),
    series: _getDefaultColumnSeries(value),
    tooltipBehavior: _tooltipBehavior,
  );
}

/// Get default column series
List<ColumnSeries<BarChartSampleData, String>> _getDefaultColumnSeries(
    value) {
  return <ColumnSeries<BarChartSampleData, String>>[
    ColumnSeries<BarChartSampleData, String>(
      dataSource: <BarChartSampleData>[
        BarChartSampleData(value[0]["ptype"], value[0]["percentage"]),
        BarChartSampleData(value[1]["ptype"], value[1]["percentage"]),
        BarChartSampleData(value[2]["ptype"], value[2]["percentage"]),
        BarChartSampleData(value[3]["ptype"], value[3]["percentage"]),
        BarChartSampleData(value[4]["ptype"], value[4]["percentage"]),
        BarChartSampleData(value[5]["ptype"], value[5]["percentage"]),
        BarChartSampleData(value[6]["ptype"], value[6]["percentage"]),
      ],
      xValueMapper: (BarChartSampleData sales, _) => sales.x as String,
      yValueMapper: (BarChartSampleData sales, _) => sales.y,
      dataLabelSettings: const DataLabelSettings(
          isVisible: true, textStyle: TextStyle(fontSize: 10)),
    )
  ];
}

class BarChartSampleData {
  BarChartSampleData(this.x, this.y);
  final String x;
  final double y;
}
