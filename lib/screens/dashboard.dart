import 'package:flutter/material.dart';

import 'package:web_1/screens/centerlist.dart';
import 'package:web_1/constraints.dart';
import 'package:web_1/screens/updatereward.dart';
import 'package:web_1/screens/barchartforcenter.dart';
import 'package:web_1/widgets/charts/piechartwidget.dart';

import 'package:web_1/widgets/statuscardlist.dart';
import 'package:web_1/widgets/topbar.dart';

String dropdownvalue = 'all';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  //DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final bool _isDesktop = _size.width >= screenLg;
    return Scaffold(
        //drawer: Drawer(),
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(color: primary),
          width: _isDesktop ? sideBarDesktopWidth : sideBarMobileWidth,
          padding: EdgeInsets.symmetric(
              vertical: 24, horizontal: _isDesktop ? 24 : 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryAncient),
                width: 45,
                height: 45,
                child: const Center(
                  child: Text(
                    'A',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      
                      children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const barchacenter(),
                            ));
                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 15, 40, 15),
                          decoration: BoxDecoration(
                              color: primaryLight,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "center details",
                            style: TextStyle(color: Colors.black87),
                          )),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => new UpdateReward(),
                            ));
                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 15, 40, 15),
                          decoration: BoxDecoration(
                              color: primaryLight,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Reward Data",
                            style: TextStyle(color: Colors.black87),
                          )),
                    )
                  ]))
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              const Topbar(),
              const statuscardlist(),
              const SizedBox(height: 20),
              //Text("${today.day}-${today.month}-${today.year}"),

              const PieChart(),
              //SizedBox(width: 10,),
              //centerlist(),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => new barchacenter(),
                      ));
                },
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: primaryLight,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "center details here",
                      style: TextStyle(color: Colors.black87),
                    )),
              )
              
            ],
          ),
        ),
      ],
    ));
  }
}
