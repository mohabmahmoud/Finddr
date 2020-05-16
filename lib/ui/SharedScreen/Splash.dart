import 'dart:async';
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
  bool lang;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const duartion=Duration(seconds: 5);


    new Timer(duartion,(){
     setState(() {
       x= SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
     });
     Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_){
return LoginScreen();

      }));
    });


  }

  @override
  Widget build(BuildContext context) {
    getlang(lang);
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

   getlang(bool l)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    l=prefs.getBool('lang');
    print(l);
    if(l==null){
      setState(() {
        lang=true;
        prefs.setBool('lang',true );
      });

    }
    else{
      lang =l;
    }


  }


}
