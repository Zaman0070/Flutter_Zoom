import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:zoom/authentication/login_screen.dart';
import 'package:zoom/authentication/register_screen.dart';
import 'package:zoom/variable.dart';

class NavigationScreen extends StatefulWidget {

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
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
                  InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen())),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 60.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: GradientColors.beautifulGreen,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text('SIGN IN',
                        style: mystyle(30,Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterScreen())),
                    child: Container(
                      width: MediaQuery.of(context).size.width/2,
                      height: 60.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: GradientColors.pinky,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text('SIGN UP',
                          style: mystyle(30,Colors.white),
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
