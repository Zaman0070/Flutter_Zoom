import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart'as feature_flag_enum;
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:zoom/variable.dart';

import 'package:flutter/cupertino.dart';



class JoinMeeting extends StatefulWidget {

  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {

  TextEditingController nameController = TextEditingController();
  TextEditingController roomController = TextEditingController();

  bool isVideoMuted = true;
  bool isAudioMuted = true;
  String username= '';

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
      username =  userDoc['username'];
    });

  }

  joinMeeting() async {
    try{
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED : false,
      };
      if(Platform.isAndroid){
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false ;
      }else if(Platform.isIOS){
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }

      var options = JitsiMeetingOptions(room: roomController.text)
      ..userDisplayName = nameController.text == '' ? username : nameController.text
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags);

      await JitsiMeet.joinMeeting(options);
    }
    catch(e){
      print('Error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Room code',
              style: mystyle(20.0),
              ),
              SizedBox(height: 20,),
              PinCodeTextField(
                controller: roomController,
                  appContext: context,
                  autoDisposeControllers: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  length: 6,
                  onChanged: (value){},
              ),
              SizedBox(height: 15,),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  helperText: 'Name(optional)',
                  hintText: 'Name',
                  labelStyle: mystyle(15, Colors.black26),
                ),
              ),
              SizedBox(height: 16,),
              CheckboxListTile(
                  value: isVideoMuted,
                  onChanged: (value){
                    setState(() {
                      isVideoMuted = value;
                    });
                  },
                secondary: Icon(Icons.video_call_outlined),
                title: Text('Video Muted',
                style: mystyle(18,Colors.black),
                ),
              ),
              SizedBox(height: 15,),
              CheckboxListTile(
                value: isAudioMuted,
                onChanged: (value){
                  setState(() {
                    isAudioMuted = value;
                  });
                },
                secondary: Icon(Icons.audiotrack),
                title: Text('Audio Muted',
                  style: mystyle(18,Colors.black),
                ),
              ),
              SizedBox(height: 20,),
              Text('Of course, you can customise your setting in the meeting',
              style: mystyle(15),
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 48,
                thickness: 2.0,
              ),
              InkWell(
                onTap: () => joinMeeting(),
                child: Container(
                  width: double.maxFinite,
                  height: 64,
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
                    child: Text('Join Meeting',
                      style: mystyle(20,Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
