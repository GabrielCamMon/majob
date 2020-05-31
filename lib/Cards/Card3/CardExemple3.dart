import 'package:flutter/material.dart';
import './widgets/tinder_card.dart';
import './model/profiles.dart';

class CardExemple3 extends StatefulWidget {
  @override
  _CardExemple3State createState() => _CardExemple3State();
}

class _CardExemple3State extends State<CardExemple3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TinderSwapCard(
        demoProfiles: demoProfiles,
        myCallback: (decision) {},
      ),
    );
  }
}

//dummy data
final List<Profile> demoProfiles = [
  new Profile(
    photos: [
      "assets/images/1.jpg",
      "assets/images/2.jpg",
      "assets/images/3.jpg",
      "assets/images/1.jpg",
      "assets/images/2.jpg",
      "assets/images/3.jpg",
    ],
    name: "Ansh mathey",
    bio: "This is the person you want",
  ),
  new Profile(
    photos: [
      "assets/images/5.jpg",
      "assets/images/6.jpg",
    ],
    name: "Amanda Tylor",
    bio: "You better swpe left",
  ),
  new Profile(
    photos: [
      "assets/images/7.jpeg",
      "assets/images/8.jpeg",
    ],
    name: "Godson Mathew",
    bio: "You better swpe left",
  ),
  new Profile(
    photos: [
      "assets/images/9.jpeg",
      "assets/images/10.jpeg",
      "assets/images/9.jpeg",
      "assets/images/10.jpeg",
    ],
    name: "Godson Mathew",
    bio: "You better swpe left",
  ),
];
