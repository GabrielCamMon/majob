import 'package:flutter/material.dart';

class ButtonEditProfile extends StatelessWidget {

  final Function editNavigation;
  final String titleButton;
  ButtonEditProfile({
    @required this.titleButton,
    @required this.editNavigation
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5),
            child: MaterialButton(
                color: Colors.blue[500],
                elevation: 3,
                minWidth: screenSize.width - screenSize.width / 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                height: screenSize.height / 15,
                child: Text(
                  titleButton,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: editNavigation),
          )
        ],
      ),
    );
  }
}
