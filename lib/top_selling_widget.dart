import 'package:flutter/material.dart';

class TopSellingWidget extends StatelessWidget {
  String image;
  String title;
  String price;
  TopSellingWidget(this.image, this.title, this.price);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.greenAccent,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.1))
          ]),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(this.image), fit: BoxFit.cover)),
          ),
          Container(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(this.title), Text(this.price)],
          )
        ],
      ),
    );
  }
}
