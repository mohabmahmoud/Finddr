import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AddDocotor extends StatefulWidget {
  @override
  _AddDocotorState createState() => _AddDocotorState();
}

class _AddDocotorState extends State<AddDocotor> {
  DocumentSnapshot SelectedSpecialization;
  DocumentSnapshot SelectedGaverenment;
  String selected1='Specializations';
  String selecred2='Gaverenments';



  TextEditingController emailCont=new TextEditingController();
  TextEditingController nameCont=new TextEditingController();

  TextEditingController passCont=new TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Add Doctor'),),body: Container(child: ListView(children: <Widget>[

      SizedBox(height: 20,),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:TextField(controller: nameCont
            ,style:
            TextStyle(fontFamily: 'mohab'),
            decoration: InputDecoration(prefixIcon: Icon(Icons.person),
                prefixText: 'Doctor Name:',
                suffixStyle: TextStyle(fontFamily: 'mohab'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),

                )
            ),)),
      SizedBox(height: 20,),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:TextField(controller: emailCont,style:
            TextStyle(fontFamily: 'mohab'),
            decoration: InputDecoration(prefixIcon: Icon(Icons.email),
                prefixText: 'Email:',
                suffixStyle: TextStyle(fontFamily: 'mohab'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),

                )
            ),)),
      SizedBox(height: 20,),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:TextField(controller: passCont
            ,style:
            TextStyle(fontFamily: 'mohab'),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                prefixText: 'Password:',
                suffixStyle: TextStyle(fontFamily: 'mohab'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),

                )
            ),)),
      SizedBox(height: 20,),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:StreamBuilder(
    stream: Firestore.instance.collection('Specializations').snapshots(),
    builder: (BuildContext context, AsyncSnapshot Snap) {
    if (!Snap.hasData) {
    return Container(child: Center(child: Text('Loading')));

    }
    else {


      return
Container(
        height: 50.0,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.0),
      border: Border.all(color: Colors.blueGrey)),
        child:
        ListTile(leading: Icon(Icons.control_point),title:

        new DropdownButtonHideUnderline(child:DropdownButton<DocumentSnapshot>(
          value: SelectedSpecialization,
          style: TextStyle(
              color: Colors.blue
          ),
          underline: Container(
            height: 2,
            color: Colors.blue,
          ),
          onChanged: (DocumentSnapshot newValue) {
            setState(() {

selected1=newValue['specializationname'];
            });
          },
          items:Snap.data.documents
              .map<DropdownMenuItem<DocumentSnapshot>>((var value) {
            return DropdownMenuItem<DocumentSnapshot>(
              value: value,
              child: Text(value['specializationname']),
            );
          })
              .toList(),
          hint: Text(selected1,style: TextStyle(fontFamily: 'mohab'),),

        )) ,)






);}


    })),
      SizedBox(height: 20,),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:StreamBuilder(
              stream: Firestore.instance.collection('Gaverenments').snapshots(),
              builder: (BuildContext context, AsyncSnapshot Snap) {
                if (!Snap.hasData) {
                  return Container(child: Center(child: Text('Loading')));

                }
                else {


                  return
                    Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            border: Border.all(color: Colors.blueGrey)),
                        child:
                        ListTile(leading: Icon(Icons.location_on),title:

                        new DropdownButtonHideUnderline(child:DropdownButton<DocumentSnapshot>(
                          value: SelectedGaverenment,
                          style: TextStyle(
                              color: Colors.blue
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.blue,
                          ),
                          onChanged: (DocumentSnapshot newValue) {
                            setState(() {
                              selecred2=newValue['Gaverenment'];

                            });
                          },
                          items:Snap.data.documents
                              .map<DropdownMenuItem<DocumentSnapshot>>((var value) {
                            return DropdownMenuItem<DocumentSnapshot>(
                              value: value,
                              child: Text(value['Gaverenment']),
                            );
                          })
                              .toList(),
                          hint: Text(selecred2,style: TextStyle(fontFamily: 'mohab'),),

                        )) ,)






                    );}


              })),
      SizedBox(height: 20,),



         Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:() {

          AddDoctor();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Theme.of(context).primaryColor,
        child:
        Text(
          'Add Doctor',
          style: TextStyle(
            color:                      Colors.white,

            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'mohab',
          ),
        ),
      ),
    )

      //select min SELECT CustomerID,COUNT(CustomerID) from Orders ORDER BY CuCustomerID ASC COUNT(CustomerID) DESC


    ],),),);
  }




  AddDoctor() async {
    print('sigup');
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailCont.text, password: passCont.text)
        .then((result) {
      Firestore.instance.collection('Users').document(result.user.uid).setData({
        'name':nameCont.text,
        'email':emailCont.text,
        'rank':2,
        'rat':5.0,
        'description':' ',
        'Gaverenments':selecred2,
        'specialization':selected1,
        'price':0,
        'address':'',
        'image':'noimage.png',
      }).then((res) {
        print('171');Navigator.pop(context);

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



}
