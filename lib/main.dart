import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states_mgmt_demo/BLoC/blocMainScreen.dart';

import 'Provider/providerMainScreen.dart';
void main() => runApp( MaterialApp(home: myApp())

);

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              title: Text("Provider"),
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ProviderMainScreen()));
              },
            ) ,
            ListTile(
              title: Text("Bloc"),
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => BlocMainScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
