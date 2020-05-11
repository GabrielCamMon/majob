import 'package:flutter/material.dart';
import 'package:majob/profile/model.dart';

class Profile extends StatelessWidget {
  
  final profile= ProfileModel(
    name: 'Alexandre Oliveira Ribeiro',
    age: '25',
    city: 'Fortaleza',
    sex: 'M',
    specialty: 'Desenvolvedor de Sitemas'
  );


  Widget _buildCoverBackground(Size screensize){
    return Container(
      height: screensize.height/2.6,
      color: Colors.blue[500],

    );
  }

  Widget _buildProfileImage(){
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/avatar_h.png'),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 8.0
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //pegando medidas para ficar padronizado (independente da tela)
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverBackground(screenSize),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screenSize.height / 6.1),
                    _buildProfileImage(),
                    Text(
                      profile.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      profile.specialty,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                      ),

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