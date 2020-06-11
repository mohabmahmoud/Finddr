import 'package:finddoctor/Constants/widthandheight.dart';
import 'package:finddoctor/ui/SharedScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CustomerReservation.dart';
class HomeCustomer extends StatefulWidget {
  String uid;
  HomeCustomer({this.uid});
  @override
  _HomeCustomerState createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
  @override
  Widget build(BuildContext context) {
    var pages=[CustomerReservation(uid:widget.uid),null,null];
int i=0;
    return Scaffold(drawer:
    Drawer(child: ListView(children: <Widget>[
      Container(height: getheight(context)/3,child: Image.asset('images/logo.jpg'),),
      ListTile(leading: Icon(Icons.home,color: Colors.blue,),title: Text('Home'),
      subtitle: Text('home page'),onTap:(){
      setState(() {
      i=1;
      });
      },),
      ListTile(leading: Icon(Icons.search,color: Colors.blue,),title: Text('Search'),
        subtitle: Text('Tap to Search'),onTap:(){
        setState(() {
          i=1;
        });
        },),
      ListTile(leading: Icon(Icons.subdirectory_arrow_left,color: Colors.blue,),title: Text('Logout'),
        subtitle: Text('Tap to Back to login Screen'),onTap: ()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setInt('rank', null);
          prefs.setString('id',null);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return LoginScreen();
          }));

        },)
    ],),),appBar: AppBar(title: Text('Home Page'),),body: pages[i],);
  }
}
