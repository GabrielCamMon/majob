import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
          
        ),
        // backgroundColor: Theme.of(context).primaryColor,
        body: Container(
        child: Text('tela de perfil'),
      ),
    );
  }
}