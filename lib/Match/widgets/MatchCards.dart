import 'package:flutter/material.dart';
import '../model/MatchCard.dart';


class MatchCards extends StatefulWidget {

  MatchCards({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<MatchCards> {
   List<Widget> cardList = null;

 void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }


  @override
  void initState() {
    //var sizeWidth = MediaQuery.of(context).size;
    // TODO: implement initState
    super.initState();
    cardList = _getMatchCard();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: cardList ,
        ),
      ),
    );
  }

    List<Widget> _getMatchCard() {
    List<MatchCard> cards = new List();
    cards.add(MatchCard(255, 0, 0, 0));
    cards.add(MatchCard(0, 255, 0, 0));
    cards.add(MatchCard(0, 0, 255, 0));
 


    List<Widget> cardList = new List();

    for (int x = 0; x < cards.length; x++) {
      cardList.add(Positioned(
        top: cards[x].margin,
        child: Draggable(
          onDragEnd: (drag){
              _removeCard(x);
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor, cards[x].blueColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 350,
              height: 460,
            ),
          ),
          child: Card(
            elevation: 12,
            color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor, cards[x].blueColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 350 ,
              height: 460,
            ),
          ),
        ),
      ));
    }

    return cardList;
  }
}