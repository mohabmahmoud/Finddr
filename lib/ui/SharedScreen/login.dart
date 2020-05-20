import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finddoctor/ui/Admin/HomeAdmin.dart';
import 'package:finddoctor/ui/Doctor/HomeDoctor.dart';
import '../Customer/HomeCustomer.dart';
import 'package:finddoctor/ui/Customer/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool fun=false;
  bool load=false;
  String error='';
  TextEditingController emailcont=TextEditingController();
  TextEditingController passcont=TextEditingController();





  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[

        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color:                      Colors.grey,
            borderRadius: BorderRadius.circular(11.0),
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

            if(passcont.text.length>=5&&isemail(email)){
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

            if(pass.length>=5&&isemail(emailcont.text)){
              setState(() {
                fun=true;
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print(error),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          error,
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontFamily: 'mohab',
          ),
        ),
      ),
    );
  }



  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:(!fun)?null: () {
          setState(() {
            load=true;
          });
          Login();


        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Theme.of(context).primaryColor,
        child:
        (load)?CircularProgressIndicator(backgroundColor:Colors.grey,):Text(
          'Login',
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
                        Text('FindDr',style:
                        TextStyle(fontFamily: 'mohab',fontSize: 30,color:
                        Colors.grey,fontWeight: FontWeight.w900)
                          ,),
                        Image.asset('images/logo.jpg',height: 70,),

                      ],))),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),

                      _buildLoginBtn(),
                      FlatButton(child:Text('New Acount for Customer',style: TextStyle(color: Colors.blue),),onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SignUpScreen();
                        }));
                      },)
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
  Login()async{
    print('login');
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .signInWithEmailAndPassword(
        email: emailcont.text, password: passcont.text).then((result){
      Getdata(result.user.uid);


    }).catchError((err) {
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

Getdata(String uid) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Firestore db = Firestore.instance;
  var ref = db.collection('Users');
   await ref.document(uid).get().then((result) {
     //results.add(User.fromMap(result.data, result.documentID));
     print(result.data['rank']);
     prefs.setString('id', uid);
     prefs.setInt('rank', result.data['rank']);

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
       return  (result.data['rank']==1)?AdminHome(uid: uid,):(result.data['rank']==2)?HomeDoctor(uid:uid):HomeCustomer(uid: uid,);

     }));






   }).catchError((error){    print(error.toString());  });







}
  bool isemail(String email){

    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email );

  }






}
