import 'package:flutter/material.dart';
import './buttonGoogleSingin.dart';
import './logoLogin.dart';

class Login extends StatelessWidget {
  final Function _singIn;
  
  Login(this._singIn);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0x7DBFBF),
      width: double.infinity,
      margin: EdgeInsets.only(top: 80, bottom: 50, left: 50, right: 50),
      child: Column(
        children: [LogoLogin(), ButtonGoogleSingIn(this._singIn)],
      ),
    );
  }
}
