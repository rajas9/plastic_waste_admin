import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_1/constraints.dart';
import 'package:web_1/screens/dashboard.dart';

class centerlist extends StatefulWidget {
  const centerlist({Key? key}) : super(key: key);

  @override
  State<centerlist> createState() => _centerlistState();
}

class _centerlistState extends State<centerlist> {
  List<dynamic>? items2 = [];
  List<dynamic> center_percentage=[0,0,0,0,0];
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

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
                child: Text("Center Data",
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
            height: 400,
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
                    int entries_length=items2!.length;
                    //print(items2![0]["p_type"]);
                    for (var i = 0; i < entries_length; i++) {
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

                    for (var i = 0; i < 5; i++) {
                      j=(pcenter[i]/entries_length)*100;
                      center_percentage[i]=double.parse((j).toStringAsFixed(2));
                    }
                    
                    return _buildDefaultColumnChart(center_percentage);

                    
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
            ],
          )
        ],
      )
    );
  }
}


SfCartesianChart _buildDefaultColumnChart(List center_percentage) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: 'Plastic Waste Collection by centers'),
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: const AxisLine(width: 0),
          labelFormat: '{value}%',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getDefaultColumnSeries(center_percentage),
      //tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Get default column series
  List<ColumnSeries<BarChartSampleData, String>> _getDefaultColumnSeries(center_percentage) {
    return <ColumnSeries<BarChartSampleData, String>>[
      ColumnSeries<BarChartSampleData, String>(
        dataSource: <BarChartSampleData>[
          BarChartSampleData('center 1',center_percentage[0]),
          BarChartSampleData('center 2',center_percentage[1]),
          BarChartSampleData('center 3',center_percentage[2]),
          BarChartSampleData('center 4',center_percentage[3]),
          BarChartSampleData('center 5',center_percentage[4]),
          
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
