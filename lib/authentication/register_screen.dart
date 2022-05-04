import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../variable.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: GradientColors.blue,
              ),
            ),
            child: Center(
              child: Image.asset('images/logo.png',
                height: 100.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height/1.6,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 30.0,right: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5.0,
                  offset: Offset(0,3),
                ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.0,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.7,
                    child: TextField(
                      controller: emailController,
                      style: mystyle(18,Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'email',
                        hintStyle: mystyle(18,Colors.grey.withOpacity(0.5),FontWeight.w400),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.7,
                    child: TextField(
                      controller: usernameController,
                      style: mystyle(18,Colors.black),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'username',
                        hintStyle: mystyle(18,Colors.grey.withOpacity(0.5),FontWeight.w400),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.7,
                    child: TextField(
                      controller: phoneController,
                      style: mystyle(18,Colors.black),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'phone',
                        hintStyle: mystyle(18,Colors.grey.withOpacity(0.5),FontWeight.w400),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.7,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: mystyle(18,Colors.black),
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: mystyle(18,Colors.grey.withOpacity(0.5),FontWeight.w400),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(height: 45.0,),
                  InkWell(
                    onTap: (){
                      try{
                        FirebaseAuth.instance.createUserWithEmailAndPassword
                          (
                            email: emailController.text,
                            password: passwordController.text
                        ).then((signedUser) {
                          userCollection.doc(signedUser.user.uid).set({
                            'username': usernameController.text,
                            'email': emailController.text,
                            'phone': phoneController.text,
                            'password': passwordController.text,
                            'uid' : signedUser.user.uid,
                          });

                        });
                        Navigator.pop(context);

                      }
                      catch(e){
                        print(e);
                        var snackBar = SnackBar(content: Text(e.toString(),style: mystyle(20),));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/2.1,
                      height: 50.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: GradientColors.pinky,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text('SIGN UP',
                          style: mystyle(26,Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ),
        ],
      ),
    );
  }
}
