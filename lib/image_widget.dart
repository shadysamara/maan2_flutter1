import 'package:flutter/material.dart';
import 'package:flutter1/images.dart';

class ImageWidget extends StatelessWidget {
  String imagePath;
  String title;
  ImageWidget(this.imagePath, this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(29), topRight: Radius.circular(29)),
          image: DecorationImage(
              image: AssetImage(this.imagePath), fit: BoxFit.cover)),
      child: Text(
        this.title,
        style: TextStyle(
            color: Colors.white, fontSize: 35, fontWeight: FontWeight.w700),
      ),
    );
  }
}
