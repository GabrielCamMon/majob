import 'package:flutter/material.dart';
import './widgets/tinder_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './model/profiles.dart';

class CardExemple3 extends StatefulWidget {
 
  String uuidUser;
  CardExemple3({this.uuidUser});
  @override
  _CardExemple3State createState() => _CardExemple3State(uuidUser: uuidUser);
}

class _CardExemple3State extends State<CardExemple3> {
  String uuidUser;
  _CardExemple3State({this.uuidUser});
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
          
          int i = 0;
          var photosa=[['assets/images/gabgit.jpeg'],['assets/images/alegit.jpeg']];
          snapshot.data.documents.forEach((e) => {
            (i<1)?i++:i=0,
             demoProfiles.add(Profile(
              id: e['uuidUser'],
              photos: photosa[i],
              name: e['name'],
              bio: e['about']))
          }
              );
       
          return TinderSwapCard(
            uuidUser:uuidUser,
            demoProfiles: demoProfiles,
            myCallback: (decision) {
             print(decision);
             print(uuidUser);
             print("funcionar pelo amor de deus");
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
