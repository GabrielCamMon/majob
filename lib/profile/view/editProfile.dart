import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:majob/Main/widget/appBarMajob.dart';
import 'package:majob/profile/model/profile.dart';

class EditProfile extends StatefulWidget {  
  ProfileModel profileModel;
  EditProfile({this.profileModel});
  @override
  _EditProfile createState() => _EditProfile(profileModel: profileModel);
}

class _EditProfile extends State<EditProfile>{
  
  ProfileModel profileModel;
  _EditProfile({this.profileModel});

  final nameController = TextEditingController();  
  final aboutController = TextEditingController();
  final specialityController = TextEditingController();
  final typeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      nameController.text = profileModel.name;
      aboutController.text = profileModel.about;
      specialityController.text = profileModel.speciality;
      typeController.text = profileModel.type;
    });
  }

  void submitForm(){
    // Firestore.instance.collection('profille')
    //     .where("uuidUser", isEqualTo: profileModel.uuidUser)
    Firestore.instance.collection('profile')
      .document(profileModel.uid)
      .updateData({
        'name': nameController.text,
        'about': aboutController.text,
        'speciality': specialityController.text,
        'type': typeController.text,
      });
      setState(() {
        profileModel.name = nameController.text;
        profileModel.about = aboutController.text;
        profileModel.speciality = specialityController.text;
        profileModel.type = typeController.text;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarMajob(),
      body: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 350,
              padding: EdgeInsets.all(10),
              child: TextField(
                
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'NOME',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Container(
              width: 350,
              padding: EdgeInsets.all(10),
              child: TextField(
                
                controller: aboutController,
                decoration: InputDecoration(
                  labelText: 'Sobre',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Container(
              width: 350,
              padding: EdgeInsets.all(10),
              child: TextField(
                
                controller: specialityController,
                decoration: InputDecoration(
                  labelText: 'Especialidade',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Container(
              width: 350,
              padding: EdgeInsets.all(10),

              child: TextField(
                
                controller: typeController,
                decoration: InputDecoration(
                  labelText: 'Tipo',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            MaterialButton(
              onPressed: submitForm,
              minWidth: screenSize.width - screenSize.width / 10,
              height: screenSize.height / 15,
              shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              color: Colors.blue[500],
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text('SALVAR'),
          ),
          ],
        ),
      ),
    );
  }
}