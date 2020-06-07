import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finddoctor/Constants/widthandheight.dart';
import 'package:finddoctor/ui/Admin/AddDoctor.dart';
import 'package:finddoctor/ui/Admin/AllDoctors.dart';
import 'package:finddoctor/ui/Admin/AllSpecializations.dart';
import 'package:finddoctor/ui/SharedScreen/login.dart';
import 'package:finddoctor/widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AllGaverenments.dart';
import 'AllUsers.dart';
class AdminHome extends StatefulWidget {
  String uid;
  AdminHome({this.uid});
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
   Firestore firestore;
   int i=0;
  @override
  Widget build(BuildContext context) {
    var pages=[Gaverenments(uid:widget.uid),Users(uid:widget.uid),Doctors(uid:widget.uid),Specializations(uid: widget.uid,)];

    return Scaffold(drawer:Drawer(child: ListView(children: <Widget>[
      Container(height: getheight(context)/3,child: Image.asset('images/logo.jpg'),),
      ListTile(selected: (i==0),leading: Icon(Icons.home,color: Colors.blue,),title: Text('All Gaverenments'),
        subtitle: Text('Add And Delete Gaverenments'),onTap: (){

        setState(() {
          i=0;
        });
        Navigator.pop(context);

        },),
      ListTile(selected: (i==1),leading: Icon(Icons.people,color: Colors.blue,),title: Text('users'),
        subtitle: Text('control with your app uesrs'),onTap: (){
        setState(() {
          i=1;
        });
        Navigator.pop(context);

        },),
      ListTile(selected: (i==2),leading: Icon(Icons.people_outline,color: Colors.blue,),title: Text('Doctors'),
        subtitle: Text('control with your app Doctors'),onTap: (){
        setState(() {
        i=2;
        });
        Navigator.pop(context);
        }),
      ListTile(selected: (i==3),leading: Icon(Icons.control_point,color: Colors.blue,),title: Text('Specializations'),
          subtitle: Text('control with your Specializations'),onTap: (){
            setState(() {
              i=3;
            });
            Navigator.pop(context);
          }),
      ListTile(leading: Icon(Icons.subdirectory_arrow_left,color: Colors.blue,),title: Text('Logout'),
        subtitle: Text('Tap to Back to login Screen'),onTap: ()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('rank', null);
          prefs.setString('id',null);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return LoginScreen();
          }));

        },)
    ],),),appBar: AppBar(title: Text('Admin Page'),),body:
       pages[i]
    );
  }
}
