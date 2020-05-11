import 'package:flutter/material.dart';
import 'package:majob/Home/home.dart';
import 'package:majob/profile/profile.dart';

class Main extends StatefulWidget{

  _Main createState() {
    return _Main();
  }
  

}

class _Main  extends State<Main> {

    //default is 0 because to init in Home 
    int _currentIndex = 0; 
    final List<Widget> _ontapMenu =  [
      Home(),
      Profile()
    ];
    void onTapMenu(int index){
      //index (0=inicio e 1=perfil)
      print(index);
      setState(() {
        _currentIndex = index;
      });
    }

  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:  _ontapMenu[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapMenu,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            title: Text('Inicio'),
            icon: Icon(Icons.home)
          ),
          new BottomNavigationBarItem(
            title: Text('Perfil'),
            icon: Icon(Icons.account_circle)
          )
        ]
      ),
    );
  }
}

