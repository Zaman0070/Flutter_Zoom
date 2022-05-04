
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../variable.dart';



class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


 String username = '';
 bool dataIsThere= false;
 TextEditingController usernameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }
  getUserData()async{
    DocumentSnapshot userDoc =
    await userCollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      //print(userDoc['username']);
      username =  userDoc['username'];
      dataIsThere =true;
    });

  }

 editProfile() async{
    userCollection.doc(FirebaseAuth.instance.currentUser.uid).update({
      'username' : usernameController.text
    });
    setState(() {
      username = usernameController.text;
    });
    Navigator.pop(context);

 }

 openEditProfileDialog() async {

    return showDialog(context: context, builder: (context)
    {
      return Dialog(
        child: Container(
          height: 200,
          child: Column(
            children: [
              SizedBox(height: 30.0,),
              Container(
                margin: EdgeInsets.only(left: 30.0,right: 30.0),
                child: TextField(
                  controller: usernameController,
                  style: mystyle(18,Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Update username',
                    labelStyle: mystyle(16,Colors.grey)
                  ),
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: ()=>editProfile(),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: GradientColors.mango,
                    ),
                  ),
                  child: Center(
                    child: Text('Update Now',
                      style: mystyle(17,Colors.white),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    }
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: dataIsThere == false ? Center(
        child: CircularProgressIndicator(),
      )
          : Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.flyHigh,
                ),
              ),

            ),
          ),
          Container(

            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 125.0,vertical: 265),
              child: CircleAvatar(
                radius: 60,
               backgroundColor: Colors.grey[400],
               child: Icon(FontAwesomeIcons.userAlt,
               size: 93,
                 color: Colors.white,
               ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300.0,),
                Text(username,
                style: mystyle(40,Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: ()=>openEditProfileDialog(),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: GradientColors.mango,
                      ),
                    ),
                    child: Center(
                      child: Text('Edit Profile',
                      style: mystyle(17,Colors.white),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
