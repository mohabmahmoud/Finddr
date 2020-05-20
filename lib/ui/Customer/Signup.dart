import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'HomeCustomer.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool fun=false;
  bool load=true;
  TextEditingController namecon=TextEditingController();
  TextEditingController emailcont=TextEditingController();
  TextEditingController phonecont=TextEditingController();

  TextEditingController passcont=TextEditingController();
  TextEditingController passcontconf=TextEditingController();



  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[

        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color:                      Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(onChanged: (email){

            if(passcont.text.length>=5&&isemail(emailcont.text)&&phonecont.text.length==11&&passcont.text==passcontconf.text&&namecon.text!=''){
              setState(() {
                fun=true;
              });
            }
            else{

              setState(() {
                fun=false;
              });


            }

          },controller: namecon,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'mohab',
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color:Colors.white,
                ),
                hintText: 'Full Name',
                hintStyle:
                TextStyle(fontFamily: 'mohab',color: Colors.white)
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[

        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color:                      Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(onChanged: (email){

            if(passcont.text.length>=5&&isemail(emailcont.text)&&phonecont.text.length==11&&passcont.text==passcontconf.text&&namecon.text!=''){
              setState(() {
                fun=true;
              });
            }
            else{

              setState(() {
                fun=false;
              });


            }

          },controller: emailcont,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'mohab',
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color:Colors.white,
                ),
                hintText: 'Email',
                hintStyle:
                TextStyle(fontFamily: 'mohab',color: Colors.white)
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[

        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color:                      Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(onChanged: (phone){

            if(passcont.text.length>=5&&isemail(emailcont.text)&&phone.length==11&&passcont.text==passcontconf.text&&namecon.text!=''){
              setState(() {
                fun=true;
              });
            }
            else{

              setState(() {
                fun=false;
              });


            }

          },controller: phonecont,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'mohab',
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.phone,
                  color:Colors.white,
                ),
                hintText: 'Phone',
                hintStyle:
                TextStyle(fontFamily: 'mohab',color: Colors.white)
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color:       Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(onChanged: (pass){

            if(passcont.text.length>=5&&isemail(emailcont.text)&&phonecont.text.length==10&&passcont.text==passcontconf.text&&namecon.text!=''){
              setState(() {
                fun=true;
              });
            }
            else{

              setState(() {
                fun=false;
              });


            }

          },controller: passcont,
            textDirection: TextDirection.rtl,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'mohab',
            ),
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Password',
              hintStyle:TextStyle(fontFamily: 'mohab',color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPasswordTFConf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color:       Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(onChanged: (pass){
            print(passcont.text.length>=5);
                print(isemail(emailcont.text));
                print(phonecont.text.length==11);
                print(passcont.text==passcontconf.text);
            print(namecon.text!='');
            if(passcont.text.length>=5&&isemail(emailcont.text)&&phonecont.text.length==11&&passcont.text==passcontconf.text&&namecon.text!=''){
              setState(() {
                fun=true;
              });
            }
            else{

              setState(() {
                fun=false;
              });


            }

          },controller: passcontconf,
            textDirection: TextDirection.rtl,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'mohab',
            ),
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Password',
              hintStyle:TextStyle(fontFamily: 'mohab',color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:(!fun)?null: () async{
          setState(() {
            load=true;
          });
          Signup();


        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Theme.of(context).primaryColor,
        child:
        (load)?CircularProgressIndicator(backgroundColor:Colors.grey,):Text(
          'SignUp',
          style: TextStyle(
            color:                      Colors.white,

            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'mohab',
          ),
        ),
      ),
    );
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(color:Colors.white ,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 70.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(child:Center(child:
                      Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                        Text('Find Dr',style:
                        TextStyle(fontFamily: 'mohab',fontSize: 30,color:
                        Colors.grey,fontWeight: FontWeight.w900)
                          ,),
                        Image.asset('images/logo.jpg',height: 70,),
                      ],))),
                      SizedBox(height: 30.0),

                      SizedBox(
                        height: 30.0,
                      ),
                      _buildNameTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                       _buildPhoneTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTFConf(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



   Signup() async {
print('sigup');
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  firebaseAuth
      .createUserWithEmailAndPassword(
      email: emailcont.text, password: passcont.text)
      .then((result) {
    Firestore.instance.collection('Users').document(result.user.uid).setData({
      'name':namecon.text,
      'email':emailcont.text,
      'phone':phonecont.text,
      'rank':3,
    }).then((res) {
print('171');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeCustomer(uid: result.user.uid)),
      );
    });
  }).
  catchError((err) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(err.message),
            actions: [
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  });


  }




  bool isemail(String email){

    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email );

  }






}
