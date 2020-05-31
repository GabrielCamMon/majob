import 'package:flutter/material.dart';
import 'package:majob/Main/widget/appBarMajob.dart';

class EditProfissionalProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMajob(),
      body: Center(
        child: RaisedButton(
          child: Text('Perfil Profissional'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}