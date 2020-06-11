import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class appointments extends StatefulWidget {
  String start;
  String end;
  String doctorname;
  String doctorid;
  String uid;
  String phone;
  String day;
  appointments({this.uid,this.start,this.end,this.doctorid,this.doctorname,this.phone,this.day});
  @override
  _appointmentsState createState() => _appointmentsState();
}

class _appointmentsState extends State<appointments> {
  var m=[];
  @override
  void initState() {

    int s=int.parse(widget.start.split(':')[0]);
    int e=int.parse(widget.end.split(':')[0]);
    for(int i=s;i<e+1;i++){
      if(i>10) {
        m.add(i.toString()+':00');
      }
      else{
        m.add('0'+i.toString()+':00');
      }
    }

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.doctorname);
    return Scaffold(appBar: AppBar(),body:
    StreamBuilder(
        stream:Firestore.instance
            .collection('Users')
        .document(widget.uid).snapshots()
    ,
    builder: (BuildContext context, AsyncSnapshot Snap) {
    if (!Snap.hasData) {
    return Container(child: Center(child: Text('Loading')));

    }
    else {
    print(Snap.data['name']);
    return ListView.builder(itemCount: m.length,itemBuilder: (context,index){
      return
        InkWell(onTap: (){

          Firestore.instance.collection('Reservations')
              .document()
              .setData({
            'Patient':Snap.data['name'],
            'uiduser': widget.uid,
            'doctor': widget.doctorname,
            'uiddoctor': widget.doctorid,
            'PatientPhone': Snap.data['phone'],
            'time': m[index],
            'day':widget.day,


          });
          Navigator.pop(context);

        },child:Container(height: 50,child:Card(color: Colors.blue,child:
     Center(child:Text(m[index],style: TextStyle(color: Colors.white),))


        ,)));
    });}}));
  }
}
