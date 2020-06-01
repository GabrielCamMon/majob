import 'package:flutter/material.dart';
import './widgets/tinder_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './model/profiles.dart';

class CardExemple3 extends StatefulWidget {
  @override
  _CardExemple3State createState() => _CardExemple3State();
}

class _CardExemple3State extends State<CardExemple3> {
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('profile').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          final List<Profile> demoProfiles = new List();
          print('vezes');
          snapshot.data.documents.forEach((e) => demoProfiles.add(Profile(
              photos: ["assets/images/1.jpg"],
              name: e['name'],
              bio: e['about'])));

          return TinderSwapCard(
            demoProfiles: demoProfiles,
            myCallback: (decision) {
             print(decision);
            },
          );
        },
      ),
    );
  }
}

void getData() {
  // databaseReference
  //     .collection("profile")
  //     .getDocuments()
  //     .then((QuerySnapshot snapshot) {
  //   snapshot.documents.forEach((f) => print('${f.data}}'));
  // });
}
//dummy data
