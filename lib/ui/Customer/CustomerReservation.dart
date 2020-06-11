import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomerReservation extends StatefulWidget {
  String uid;
  CustomerReservation({this.uid});
  @override
  _CustomerReservationState createState() => _CustomerReservationState();
}

class _CustomerReservationState extends State<CustomerReservation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child:
    StreamBuilder(
        stream: Firestore.instance.collection('Reservations').where(
            'uiduser', isEqualTo: widget.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot Snap) {
          if (!Snap.hasData) {
            return Container(child: Center(child: Text('Loading')));
          }
          else {
            return ListView.builder(itemBuilder: (context,index){
              return Card(child: Column(children: <Widget>[
                Text('You has reservation with doctor '+Snap.data.documents[index]['doctor']+'at '+
                    Snap.data.documents[index]['time']+'on the'+Snap.data.documents[index]['day']+ 'th'),
                Text('doctor Phone:'+Snap.data.documents[index]['doctorPhone'],style: TextStyle(color: Colors.blue),)
              ],),);
            },itemCount:Snap.data.documents.length,);

          }}),),);
  }
}
