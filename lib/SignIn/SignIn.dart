
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:majob/profile/model/profile.dart';
import '../Main/main_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool controlProfile = true; 

  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child("pathDemo");

  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _user;

  GoogleSignIn _googleSignIn = new GoogleSignIn();

  void _sendData() {
    databaseReference
        .push()
        .set({'first_Name': 'Sujan', 'lastName': 'Gabriel'});
  }
  final Firestore _firestore = Firestore.instance;
  ProfileModel createProfile(FirebaseUser user) {
    if (controlProfile){

      print('adicoinando profile');
      _firestore.collection('profile').add({
          'name': user.displayName,
          'about': '',
          'speciality': '',
          'type': '',
          'uuidUser': user.uid
      });
      controlProfile = false;
      return ProfileModel(
        name: user.displayName,
        about: '',
        speciality: '',
        type: '',
        uuidUser: user.uid
      );
    }
  }

  ProfileModel createOrGetprofile(FirebaseUser user){

    ProfileModel profile;

    print('passou aqui');

    Firestore.instance
      .collection('profile')
      .where("uuidUser", isEqualTo:user.uid)
      .snapshots()
      .listen((data) {
        if (controlProfile){
          if (data.documents.length == 0){
            profile = createProfile(user);
            // return createProfile(user);
          } else{
            DocumentSnapshot profileQuery = data.documents[0];
            profile = ProfileModel(
              name: profileQuery['name'],
              about: profileQuery['about'],
              speciality: profileQuery['spreciality'],
              type: profileQuery['type'],
              uuidUser: profileQuery['uuidUser']
            );
          }
          controlProfile = false;

        }
        return profile;
      }
        
    );
    
  }

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//          backgroundColor: Theme.of(context).primaryColor,
//         body: isSignIn
//             ? Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     CircleAvatar(
//                       backgroundImage: NetworkImage(_user.photoUrl),
//                     ),
//                     Text(_user.displayName),
//                     OutlineButton(onPressed: (){
//                       googleSignOut();
//                     },child: Text("Logout"),)
//                   ],
//                 ),
//               )
//             : Login(handleSignIn),
//       );
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Theme.of(context).primaryColor,
        body: isSignIn
            ? Main()
            : Login(handleSignIn),
      );
  }

  bool isSignIn = false;

  

  Future<void> handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = (await _auth.signInWithCredential(credential));

    _user = result.user;
    ProfileModel a = createOrGetprofile(_user);

    setState(() {
      isSignIn = true;
    });
  }

  Future<void> googleSignOut() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = false;
      });
    });
    controlProfile = true;
  }
}
