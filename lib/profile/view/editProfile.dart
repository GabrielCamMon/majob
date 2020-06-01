import 'package:flutter/material.dart';
import 'package:majob/Main/widget/appBarMajob.dart';

class EditProfile extends StatefulWidget {  

  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMajob(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              
              decoration: InputDecoration(
                labelText: 'NOME',
                border: OutlineInputBorder()
              ),
            )
          ],
        ),
      ),
    );
  }
}