import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ShowDoctors.dart';
class Search extends StatefulWidget {
  String uid;
  Search({this.uid});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DocumentSnapshot SelectedSpecialization;
  DocumentSnapshot SelectedGaverenment;
  String selected1='Specializations';
  String selecred2='Gaverenments';
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: Container(child:RaisedButton(color: Colors.blue,child: Text('Filter'),onPressed: (){

      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Show(Gavernment: selecred2,spact: selected1,uid: widget.uid,);
      }));


    },)),body: Container(child:ListView(children: <Widget>[

      Padding(padding: EdgeInsets.only(top:100,left: 10,right: 10),
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

                        )
                        ) ,)






                    );}


              })),


    ],),));
  }
}
