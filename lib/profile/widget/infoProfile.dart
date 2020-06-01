import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:majob/profile/widget/radialProgress.dart';
import 'package:majob/profile/widget/roudedImage.dart';

class InfoProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadialProgress(
            width: 4,
            goalCompleted: 0.9,
            child: RoundedImage(
              imagePath: "assets/images/eu.jpg",
              size: Size.fromWidth(150.0),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            'Alexandre Oliveira Ribeiro',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'Sistemas de informação',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
