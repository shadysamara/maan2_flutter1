import 'package:flutter/material.dart';
import 'package:flutter1/navigation_test/page2_test.dart';
import 'package:flutter1/services/router_service.dart';

class Page1Nav extends StatelessWidget {
  static final String routeName = 'page1Route';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              int x = 0;
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (context) {
              //     return Page2Nav('this message from page1');
              //   }),
              // );
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) {
              //   return Page2Nav('this message from page1');
              // }));
            NavigationService.navigationService.navigatorReplacemnt(Page2Nav.routeName);
            },
            child: Text('Go to page2')),
      ),
    );
  }
}
