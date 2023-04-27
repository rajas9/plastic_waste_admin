import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class navdrawer extends StatelessWidget {
  const navdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(200, 100, 149, 237),
              ),
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: const Text('Record Inventory'),
            /*onTap: () {
              Navigator.push
                          (context,
                            new MaterialPageRoute(
                              builder: (context)=> new recordinventory(),
                            ));
            },*/
          ),
          ListTile(
            leading: Icon(Icons.inventory_2),
            title: Text('Request Inventory'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.inventory_2_rounded),
            title: Text('UPI Inventory'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.check),
            title: Text('EWASTE process'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.person_off),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          /*ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),*/
        ],
      ),
    );
  }
}