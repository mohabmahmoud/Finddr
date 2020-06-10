import 'package:finddoctor/Constants/widthandheight.dart';
import 'package:finddoctor/ui/SharedScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UpdateDays.dart';
import 'Updateprofile.dart';
import 'ShowReservations.dart';

class HomeDoctor extends StatefulWidget {
  String uid;
  HomeDoctor({this.uid});
  @override
  _HomeDoctorState createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  int i=1;

  @override
  Widget build(BuildContext context) {
    var pages=[ShowReservations(uid:widget.uid)  ,Editmydata(uid:widget.uid),UpdateDays(uid:widget.uid)];
    return Scaffold(drawer:
    Drawer(child: ListView(children: <Widget>[
      Container(height: getheight(context)/3,child: Image.asset('images/logo.jpg'),),

      ListTile(leading: Icon(Icons.home,color: Colors.blue,),title: Text('Home'),
        subtitle: Text('Show All  Reservations'),

      onTap: (){

setState(() {
  i=0;

});
Navigator.pop(context);},
      ),
      ListTile(leading: Icon(Icons.person,color: Colors.blue,),title: Text('Edit Profile'),
        subtitle: Text('Edit my data'),
          onTap: (){
            setState(() {
              i=1;

            });

            Navigator.pop(context);
          }


      ),
      ListTile(leading: Icon(Icons.calendar_today,color: Colors.blue,),title: Text('Update Work Days'),
        subtitle: Text('change my time table'),
          onTap: (){
            setState(() {
              i=2;

            });
            Navigator.pop(context);
          }


          ),



      ListTile(leading: Icon(Icons.subdirectory_arrow_left,color: Colors.blue,),title: Text('Logout'),
        subtitle: Text('Tap to Back to login Screen'),onTap: ()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('rank', null);
          prefs.setString('id',null);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return LoginScreen();
          }));

        },)
    ],),),appBar: AppBar(title: Text('Home Page'),),body:pages[i]);
  }
}

