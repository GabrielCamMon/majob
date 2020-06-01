import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:majob/profile/widget/radialProgress.dart';
import 'package:majob/profile/widget/roudedImage.dart';

class InfoProfile extends StatelessWidget {
  String uid = '';
  String name = '';
  String speciality = '';

  InfoProfile({
    this.uid,
    this.name,
    this.speciality
  }); 
  

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
              imagePath: (uid == 'OweCHIwlo2JHFKs7mDic')? "assets/images/eu.jpg":"assets/images/gabgit.jpeg",
              size: Size.fromWidth(150.0),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            (name == null)? '':name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            (speciality == null)? '':speciality,
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
