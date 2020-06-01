import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:majob/Cards/Card3/widgets/tinder_card.dart';
import 'package:majob/profile/widget/infoProfile.dart';
import 'package:majob/profile/widget/opaqueImage.dart';

class Profile extends StatelessWidget {


  FirebaseAuth _auth = FirebaseAuth.instance;

  


  GoogleSignIn _googleSignIn = new GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    


    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Stack(
                children: <Widget>[
                  OpaqueImage(
                    imageUrl: "assets/images/eu.jpg",
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                          ),
                          InfoProfile(),
                          Container(
                            margin: EdgeInsets.only(bottom: 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                
                                RoundIconButton(
                                  size: 80,
                                  
                                  icon: Icons.exit_to_app,                        
                                  iconColor: Colors.blue[500],
                                  
                                  onPressed: () {
                                    
                                  }
                                ),
                                RoundIconButton(
                                  size: 80,
                                  
                                  icon: Icons.edit,                        
                                  iconColor: Colors.blue[500],
                                  
                                  onPressed: () {}
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      
                    ),
                  ),
                  
                ],
              ),
              
            ),
          ],
        )
      ],
    );
  }
}
