import 'package:flutter/material.dart';
import 'package:flutter1/navigation_test/page3_test.dart';

class Page2Nav extends StatelessWidget {
  static final String routeName = 'page2Route';

  String title;
  Page2Nav(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              String x = await Navigator.pushReplacementNamed(
                  context, Page3Nav.routeName);
              print(x);
            },
            child: Text('Go to page3')),
      ),
    );
  }
}
