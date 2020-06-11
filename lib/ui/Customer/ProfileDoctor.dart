import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Available appointments.dart';
class Profile extends StatefulWidget {
  String did;
  String uid;
  Profile({this.did,this.uid});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name;
  @override
  Widget build(BuildContext context) {
    print(widget.did);
    print('mohab');
    return Scaffold(appBar: AppBar(title: Text('Profile'),),body:
         ListView(children: <Widget>[
    Container(height: 300,child:StreamBuilder(
    stream:Firestore.instance
        .collection('Users')
        .document(widget.did).snapshots()
        ,
    builder: (BuildContext context, AsyncSnapshot Snap) {
    if (!Snap.hasData) {
    return Container(child: Center(child: Text('Loading')));

    }
    else {
      name=Snap.data['name'];
   return   Card(child:Column(children: <Widget>[
        Container(height:100,width:100,child:CircleAvatar(backgroundImage:
        NetworkImage('https://firebasestorage.googleapis.com/v0/b/finddr-9761c.appspot.com/o/'+Snap.data['image']+'?alt=media&token=f45864f5-6a86-468d-9b32-b1069743365b',

        ),)),
        Text(Snap.data['name'],style: TextStyle(fontSize: 20),),

        Text(Snap.data['description'],style: TextStyle(fontSize: 15)),
        Text('Price:'+Snap.data['price']+'\$',style: TextStyle(fontSize: 18,color: Colors.blue),),
     Text(Snap.data['address'],style: TextStyle(fontSize: 15)),
     Text(Snap.data['specialization'],style: TextStyle(fontSize: 15)),
     Text(Snap.data['phone'],style: TextStyle(fontSize: 15)),

      ],),

      )
    ;}})),

           Container(height: 150,child:StreamBuilder(
               stream:Firestore.instance
                   .collection('Days')
                   .snapshots()
               ,
               builder: (BuildContext context, AsyncSnapshot Snap) {
                 if (!Snap.hasData) {
                   return Container(child: Center(child: Text('Loading')));

                 }
                 else {


                   return
                     ListView.builder(itemCount: 7,scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                       return Card(child:Column(children: <Widget>[
                         Container(color: Colors.blue,child:Text(Snap.data.documents[index]['name'],style: TextStyle(fontSize: 20,color:Colors.white),)),
                         (Snap.data.documents[index]['start']==''||Snap.data.documents[index]['end']=='')?Text('Holiday',style: TextStyle(color: Colors.red),):
                         InkWell(onTap:(){
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return appointments(uid:widget.uid,
                               start:Snap.data.documents[index]['start'],
                                 end:Snap.data.documents[index]['end']
                                 ,doctorid:widget.did,
                                  doctorname:name,
                                  day: Snap.data.documents[index]['name'],);

                           }));
                         },child:Column(children: <Widget>[
                           Text('form:'+Snap.data.documents[index]['start']),
                           Text('to:'+Snap.data.documents[index]['end'])

                         ],))

                       ],)
                       );
                     })

                   ;}})),





         ])



    );
  }
}
