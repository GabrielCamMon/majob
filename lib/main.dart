import 'package:flutter/material.dart';
import 'package:majob/Match/model/MatchCard.dart';
import 'package:majob/SignIn/SignIn.dart';
import './Cards/Card1/CardExemple.dart';
import './Cards/Card2/CardExemple2.dart';
import './Cards/Card3/CardExemple3.dart';

import 'package:majob/profile/view/profile.dart';
import './Main/main_login.dart';
import './Match/Match.dart';
import './Chat/views/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch:MaterialColor(Colors.blue.shade500.value,{
              50: Colors.blue.shade50,
              100: Colors.blue.shade100,
              200: Colors.blue.shade200,
              300: Colors.blue.shade300,
              400: Colors.blue.shade400,
              500: Colors.blue.shade500,
              600: Colors.blue.shade600,
              700: Colors.blue.shade700,
              800: Colors.blue.shade800,
              900: Colors.blue.shade900
          }),
           accentColor: Colors.grey[600],
        ),
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //child: Match(),
      //  child: SignIn(),
     child: Main(),
     // child: EditPersonalProfile(),
      //child:ChatScreen()
     //child: CardExemple3(),
    );
  }
}
