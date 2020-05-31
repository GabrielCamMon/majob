import 'package:flutter/material.dart';
import 'package:majob/Main/widget/appBarMajob.dart';

class EditPersonalProfile extends StatefulWidget {  

  @override
  _EditPersonalProfile createState() => _EditPersonalProfile();
}

class _EditPersonalProfile extends State<EditPersonalProfile>{
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