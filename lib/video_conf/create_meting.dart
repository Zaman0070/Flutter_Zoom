import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:uuid/uuid.dart';
import 'package:zoom/variable.dart';

class CreateMeeting extends StatefulWidget {

  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {

  String code ='';

  createCode(){
    setState(() {
      code = Uuid().v1().substring(0, 6);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.0,left: 5,right: 5),
            child: Text('Create a code and share it with you friend',
            style: mystyle(20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Code :',style: mystyle(30.0),),
              Text(code,
              style: mystyle(30,Colors.purple,FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 25.0,),
          InkWell(
            onTap: () => createCode(),
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [BoxShadow(
                  blurRadius: 6.0,
                  offset: Offset(0,2),
                  color: Colors.black45,
                ),
                ],
                gradient: LinearGradient(
                  colors: GradientColors.facebookMessenger
                ),
              ),
              child: Center(
                child: Text('Create code',
                style: mystyle(20,Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
