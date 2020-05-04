import 'package:flutter/material.dart';
import './widgets/MatchCards.dart';

class Match extends StatefulWidget {
  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MatchCards(),
    );
  }
}