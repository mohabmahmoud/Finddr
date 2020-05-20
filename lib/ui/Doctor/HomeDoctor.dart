import 'package:flutter/material.dart';

class HomeDoctor extends StatefulWidget {
  String uid;
  HomeDoctor({this.uid});
  @override
  _HomeDoctorState createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Home Page'),),body: Container(child: Center(child:Text('Doctor'+'mohab')),),);
  }
}

