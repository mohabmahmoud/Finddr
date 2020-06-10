import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ShowReservations extends StatefulWidget {
  String uid;
  ShowReservations({this.uid});
  @override
  _ShowReservationsState createState() => _ShowReservationsState();
}

class _ShowReservationsState extends State<ShowReservations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child:
    StreamBuilder(
    stream: Firestore.instance.collection('Reservations').where(
        'uiddoctor', isEqualTo: widget.uid).snapshots(),
    builder: (BuildContext context, AsyncSnapshot Snap) {
    if (!Snap.hasData) {
    return Container(child: Center(child: Text('Loading')));
    }
    else {
      return ListView.builder(itemBuilder: (context,index){
        return Card(child: Column(children: <Widget>[
          Text('Patient:'+Snap.data.documents[index]['Patient']+'made your reservation at '+
              Snap.data.documents[index]['time']+'on the'+Snap.data.documents[index]['day']+ 'th'),
          Text('Patient Phone:'+Snap.data.documents[index]['PatientPhone'],style: TextStyle(color: Colors.blue),)
        ],),);
      },itemCount:Snap.data.documents.length,);

    }}),),);
  }
}
