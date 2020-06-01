import 'package:flutter/material.dart';
import 'package:majob/Cards/Card3/CardExemple3.dart';
//import 'package:majob/Home/home.dart';
import 'package:majob/Main/widget/appBarMajob.dart';
import 'package:majob/profile/view/profile.dart';
import '../Chat/views/chat_screen.dart';


class Main extends StatefulWidget {
  Function googleLogout;

  Main({
    this.googleLogout
  });

  _Main createState() {
    return _Main(
      googleLogout: googleLogout
    );
  }
}

class _Main extends State<Main> {

  Function googleLogout;

  _Main({
    this.googleLogout
  });

  //default is 0 because to init in Home
  int _currentIndex = 0;
  
  void onTapMenu(int index) {
    //index (0=inicio e 1=perfil)
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> _ontapMenu = [
    Profile(
      googleLogout: (){
        googleLogout();
      } ,
    ),
    CardExemple3(),
    ChatScreen(),
  ];
    return Scaffold(
      body: _ontapMenu[_currentIndex],
      appBar: AppBarMajob(),
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapMenu,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
              title: Text('Perfil'), icon: Icon(Icons.account_circle)),
          new BottomNavigationBarItem(
            title: Text('Match'),
            icon: Image.asset(
              './assets/images/logo-black.png',
              height: 30,
            ),
          ),
      new BottomNavigationBarItem(
              title: Text('Chat'), icon: Icon(Icons.chat)),
        ],
      ),
      
    );
  }
}
