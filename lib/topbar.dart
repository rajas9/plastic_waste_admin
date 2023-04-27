import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:web_1/constraints.dart';

class Topbar extends StatelessWidget {
  const Topbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: topBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: componentPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 4,
                    width: 115,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  bottom: 0,
                  left: 0,
                )
                
              ],
    ),
        ]));
  }
}