import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majob/profile/model/profile.dart';
import 'package:majob/profile/view/editPersonalProfile.dart';
import 'package:majob/profile/view/editProfissionalProfile.dart';
import 'package:majob/profile/widget/buttonEditProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatelessWidget {
  final profile = ProfileModel(
      name: 'Alexandre Oliveira Ribeiro',
      about: '17/12/1994',
      speciality: 'Fortaleza',
      type: 'M',
      uuidUser: 'Desenvolvedor de Sitemas');

  final Firestore _firestore = Firestore.instance;

  Widget _buildCoverBackground(Size screensize) {
    return Container(
      height: screensize.height / 2.6,
      color: Colors.blue[500],
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/avatar_h.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(80.0),
            border: Border.all(color: Colors.white, width: 8.0)),
      ),
    );
  }

  void navigationProfile() {
    print('alexa');
  }

  void getUserLogged() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    // return user;
  }

  Future<void> t(BuildContext context) async {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      // await _firestore.collection('profile').add({
      //   'name': 'Alexandre Oliveira Ribeiro',
      //   // 'genre': 'M',
      //   'about': 'SOu um cara bem legal',
      //   // 'city': 'Fortaleza',
      //   'speciality': 'Programador de sistemas',
      //   'type': 'Empregado',
      //   'uuidUser': '1bWDs0zP8reMU2y4plF0xRogJsw2'
      // });
      // await _firestore.collection('profile').add({
      //   'name': 'Gabriel Monteiro',
      //   // 'genre': 'M',
      //   'about': 'Esse cara é maluco',
      //   // 'city': 'Fortaleza',
      //   'speciality': 'Empresario',
      //   'type': 'Empregador',
      //   'uuidUser': '6Ae6E45U07fHJf7DHgZK8twcXoK2'
      // });
      print(user);
    }
    @override
    Widget build(BuildContext context) {
      void navigationPersonalProfile() {
        print('teste');

        t(context);

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => EditPersonalProfile()));
      }

      void navigationProfissionalProfile() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditProfissionalProfile()));
      }

      // pegando medidas para ficar padronizado (independente da tela)
      Size screenSize = MediaQuery.of(context).size;
      return Scaffold(
        body: Stack(
          children: <Widget>[
            _buildCoverBackground(screenSize),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: screenSize.height / 6.1),
                    _buildProfileImage(),
                    Text(
                      profile.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      profile.speciality,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                    ButtonEditProfile(
                      titleButton: 'PESSOAL',
                      editNavigation: navigationPersonalProfile,
                    ),
                    ButtonEditProfile(
                      titleButton: 'PROFISSIONAL',
                      editNavigation: navigationProfissionalProfile,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  
}
