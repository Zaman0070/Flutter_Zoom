import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zoom/authentication/navigate_screen.dart';
import 'package:zoom/variable.dart';

class IntroAuthScreen extends StatefulWidget {

  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome',
          body: 'Welcome to FOOM, the best video conference call ',
          image: Center(
            child: Image.asset(
              'images/welcome.png',
              height: 175,
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: mystyle(20,Colors.black),
            bodyTextStyle: mystyle(20,Colors.black),
          ),
        ),
        PageViewModel(
          title: 'Join or start meeting',
          body: 'Easy to use interface, join or start meeting in a fast time ',
          image: Center(
            child: Image.asset(
              'images/conference.png',
              height: 175,
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: mystyle(20,Colors.black),
            bodyTextStyle: mystyle(20,Colors.black),
          ),
        ),
        PageViewModel(
          title: 'security',
          body: 'Your security is important for us, Our service is secure and reliable',
          image: Center(
            child: Image.asset(
              'images/secure.jpg',
              height: 175,
            ),
          ),
          decoration: PageDecoration(
            titleTextStyle: mystyle(20,Colors.black),
            bodyTextStyle: mystyle(20,Colors.black),
          ),
        ),
      ],
      onDone: (){
       Navigator.push(context, MaterialPageRoute(builder: (_)=>NavigationScreen()));
      },
      onSkip: (){},
      showSkipButton: true,
      skip: const Icon(Icons.skip_next,size: 45,),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text('Done',
        style: mystyle(20,Colors.black),
      ),
    );
  }
}
