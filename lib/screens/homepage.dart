import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:web_1/screens/dashboard.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 50, right: 8, bottom: 8, left: 8),
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8), // Darker shadow color
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Adjust the offset for desired shadow direction
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildPageTile(context, 'Page 1', '/page1'),
                      buildPageTile(context, 'Page 2', '/page2'),
                      buildPageTile(context, 'Page 3', '/page3'),
                      buildPageTile(context, 'Page 4', '/page4'),
                      buildPageTile(context, 'Page 5', '/page5'),
                      buildPageTile(context, 'Page 6', '/page6'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: dashboard()
          ),
        ],
      ),
    );
  }
}

 Widget buildPageTile(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // Adjust the offset for desired shadow direction
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          // onTap: () {
          //   Navigator.pushNamed(context, route);
          // },
        ),
      ),
    );
  }
