import 'dart:async';
import 'package:finddoctor/ui/Admin/HomeAdmin.dart';
import 'package:finddoctor/ui/Customer/HomeCustomer.dart';
import 'package:finddoctor/ui/Doctor/HomeDoctor.dart';
import 'package:finddoctor/ui/SharedScreen/login.dart';

import '../../Constants/widthandheight.dart';
import '../../widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var x=SystemChrome.setEnabledSystemUIOverlays ([]);
  String id;
  int rank;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const duartion=Duration(seconds: 4 );


    new Timer(duartion,(){
     setState(() {
       x= SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
     });
     Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_){
return (rank==null)? LoginScreen(): (rank==1)?AdminHome(uid: id,):(rank==2)?HomeDoctor(uid:id):HomeCustomer(uid: id,);

      }));
    });


  }

  @override
  Widget build(BuildContext context) {
    getdata();
    x;
    return Scaffold(bottomNavigationBar: Container(height: getheight(context)/4-70,
    child:Center(
      child:Loader()
    )
    ),
      body: Container(
        child: Center(child:
        new Image.asset('images/logo.jpg',
          width: getwidth(context)/2,
    )))
    );
  }

   getdata()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id=prefs.getString('id');
    if(id==null){
      setState(() {
        prefs.setString('id',null );
      });

    }
    else{
      setState(() {
      id =id;
      rank=prefs.getInt('rank');});
    }


  }


}
