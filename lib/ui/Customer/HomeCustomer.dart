import 'package:finddoctor/Constants/widthandheight.dart';
import 'package:flutter/material.dart';
class HomeCustomer extends StatefulWidget {
  String uid;
  HomeCustomer({this.uid});
  @override
  _HomeCustomerState createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer:
    Drawer(child: ListView(children: <Widget>[
      Container(height: getheight(context)/3,child: Image.asset('images/logo.jpg'),),
      ListTile(leading: Icon(Icons.home,color: Colors.blue,),title: Text('Home'),
      subtitle: Text('home page'),),
      ListTile(leading: Icon(Icons.search,color: Colors.blue,),title: Text('Search'),
        subtitle: Text('Tap to Search'),),
      ListTile(leading: Icon(Icons.subdirectory_arrow_left,color: Colors.blue,),title: Text('Logout'),
        subtitle: Text('Tap to Back to login Screen'),)
    ],),),appBar: AppBar(title: Text('Home Page'),),body: Container(child: Center(child:Text(widget.uid)),),);
  }
}
