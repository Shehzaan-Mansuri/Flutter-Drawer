import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'new_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => NewPage("New Page"),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 50.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Shehzaan"),
              accountEmail: Text("Shehzaanmansuri1@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.deepPurple
                        : Colors.white,
                child: Text("S"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.deepPurple
                          : Colors.white,
                  child: Text("A"),
                ),
              ],
            ),
            ListTile(
              title: Text("Page One"),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder:(BuildContext context) => NewPage("Page One")));
              },
            ),
            ListTile(
              title: Text("Page Two"),
              trailing: Icon(Icons.arrow_downward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder:(BuildContext context) => NewPage("Page One")));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Page One"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
