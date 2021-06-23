import 'package:flutter/material.dart';
import 'package:flutter1/navigation_test/page1_test.dart';

class Page3Nav extends StatelessWidget {
  static final String routeName = 'page3Route';
  int dummyNumber;
  Page3Nav(this.dummyNumber);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Page3 $dummyNumber'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(Page1Nav.routeName));
            },
            child: Text('Go back to page2')),
      ),
    );
  }
}
