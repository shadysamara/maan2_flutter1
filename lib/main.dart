import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Page1(),
  ));
}

/*
materialApp
Scaffold
Appbar
Text
Center
Container


*/
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Maan Flutter'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(30),
          color: Colors.blue,
          child: Text(
            'Body Content',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
