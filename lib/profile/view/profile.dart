import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majob/Cards/Card3/widgets/tinder_card.dart';
import 'package:majob/profile/model/profile.dart';
import 'package:majob/profile/view/editProfile.dart';
import 'package:majob/profile/widget/infoProfile.dart';
import 'package:majob/profile/widget/opaqueImage.dart';

class Profile extends StatefulWidget {
  Function googleLogout;

  Profile({this.googleLogout});

  @override
  _Profile createState() => _Profile(googleLogout: googleLogout);
}

class _Profile extends State<Profile> {

  Function googleLogout;
  ProfileModel profileModel = ProfileModel();

  _Profile({this.googleLogout});

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void getUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('profile')
        .where("uuidUser", isEqualTo: user.uid)
        .snapshots()
        .listen((data) {
      DocumentSnapshot profileQuery = data.documents[0];

      setState(() {
        profileModel = ProfileModel(
            uid: profileQuery.documentID,
            name: profileQuery['name'],
            about: profileQuery['about'],
            speciality: profileQuery['speciality'],
            type: profileQuery['type'],
            uuidUser: profileQuery['uuidUser']);
      });
    });
  }
  //
  //   );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    void navigationEditProfile() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EditProfile(profileModel: profileModel,)));
    }

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Stack(
                children: <Widget>[
                  OpaqueImage(
                    imageUrl: "assets/images/eu.jpg",
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                          ),
                          InfoProfile(
                            name: (profileModel.name == null)
                                ? ''
                                : profileModel.name,
                            speciality: (profileModel.speciality == null)
                                ? ''
                                : profileModel.speciality,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RoundIconButton(
                                    size: 80,
                                    icon: Icons.exit_to_app,
                                    iconColor: Colors.blue[500],
                                    onPressed: googleLogout),
                                RoundIconButton(
                                    size: 80,
                                    icon: Icons.edit,
                                    iconColor: Colors.blue[500],
                                    onPressed: navigationEditProfile),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
