import 'package:flutter/material.dart';
import '../Match/Match.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Match(),
      
    );
  }
}