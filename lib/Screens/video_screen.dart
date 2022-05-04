import 'package:flutter/material.dart';
import 'package:zoom/variable.dart';
import 'package:zoom/video_conf/create_meting.dart';
import 'package:zoom/video_conf/join_meeting.dart';

class VideoScreen extends StatefulWidget {

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>  with SingleTickerProviderStateMixin{

  TabController tabController;

  buildTab(String name){
    return Container(
      width: 150.0,
      height: 50.0,
      child: Card(
        child: Center(
          child: Text(name,style: mystyle(15,Colors.black,FontWeight.w700),),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text('FOOM',
        style: mystyle(22,Colors.white,FontWeight.w700,),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            buildTab('Join Meeting',),
            buildTab('Create Meeting'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [

        JoinMeeting(),
        CreateMeeting(),

      ],
      ),
    );
  }
}
