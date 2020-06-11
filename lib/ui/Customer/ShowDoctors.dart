import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ProfileDoctor.dart';
class Show extends StatefulWidget {
  String uid;
  String spact;
  String Gavernment;
  Show({this.spact,this.Gavernment,this.uid});
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Filter'),),body:

    StreamBuilder(
      stream: Firestore.instance.collection('Users').where('Gaverenments',isEqualTo: widget.Gavernment).where('specialization',isEqualTo: widget.spact).snapshots(),
      builder: (BuildContext context, AsyncSnapshot Snap) {
        if (!Snap.hasData) {
          return Container(child: Center(child: Text('Loading')));

        }
        else {
          print(Snap.data.documents);
          return Container(child:
          ListView.builder(itemCount: Snap.data.documents.length, itemBuilder: (context, index) {
            return InkWell(onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Profile(did: Snap.data.documents[index]['uid'].toString(),uid: widget.uid,);
              }));

            },child:
            Card(child:Column(children: <Widget>[
               Container(height:100,width:100,child:CircleAvatar(backgroundImage:
                NetworkImage('https://firebasestorage.googleapis.com/v0/b/finddr-9761c.appspot.com/o/'+Snap.data.documents[index]['image']+'?alt=media&token=f45864f5-6a86-468d-9b32-b1069743365b',

                ),)),
               Text(Snap.data.documents[index]['name'],style: TextStyle(fontSize: 20),),

                Text(Snap.data.documents[index]['description'],style: TextStyle(fontSize: 15)),
                Text('Price:'+Snap.data.documents[index]['price']+'\$',style: TextStyle(fontSize: 18,color: Colors.blue),)
              ],),

              ));
          }),);
        }
      },)

      ,);
  }
}
