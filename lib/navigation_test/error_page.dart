import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Text('ERROR, your route name is not defined'),
      ),
    );
  }
}
