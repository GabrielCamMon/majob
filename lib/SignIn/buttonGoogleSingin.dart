import 'package:flutter/material.dart';

class ButtonGoogleSingIn extends StatelessWidget {
  final Function _singIn;

  ButtonGoogleSingIn(this._singIn);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width *0.15),
      child: FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white),
        ),
        textColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: MediaQuery.of(context).size.width *0.15),
        child: Text(
          'SingIn with Google',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        onPressed:this._singIn,
      ),
    );
  }
}
