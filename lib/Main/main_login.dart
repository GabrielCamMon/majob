import 'package:flutter/material.dart';
import 'package:majob/Home/home.dart';
import 'package:majob/profile/profile.dart';
import '../Chat/views/chat_screen.dart';

class Main extends StatefulWidget {
  _Main createState() {
    return _Main();
  }
}

class _Main extends State<Main> {
  //default is 0 because to init in Home
  int _currentIndex = 1;
  final List<Widget> _ontapMenu = [
    Profile(),
    Home(),
    ChatScreen(),
  ];
  void onTapMenu(int index) {
    //index (0=inicio e 1=perfil)
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ontapMenu[_currentIndex],
      appBar: AppBar(
        title: Image.asset(
          './assets/images/logowhite.png',
          height: 60,
        ),
        centerTitle: true,
      ),
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
              title: Text('Perfil'), icon: Icon(Icons.chat)),
        ],
      ),
      
    );
  }
}
