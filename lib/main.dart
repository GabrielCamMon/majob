import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:majob/login.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child("pathDemo");

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  // @override
  // void initState(){
  //   super.initState();
  //   isSignIn = false;
  // }
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  void _sendData() {
    databaseReference
        .push()
        .set({'first_Name': 'Sujan', 'lastName': 'Gabriel'});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        backgroundColor: Color(0xff7DBFBF),
        body: isSignIn
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(_user.photoUrl),
                    ),
                    Text(_user.displayName),
                    OutlineButton(onPressed: (){
                      googleSignOut();
                    },child: Text("Logout"),)
                  ],
                ),
              )
            : Login(handleSignIn),
      ),
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
  }
}
