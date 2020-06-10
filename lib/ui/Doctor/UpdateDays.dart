import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finddoctor/ui/Doctor/updateday.dart';
import 'package:flutter/material.dart';



class UpdateDays extends StatefulWidget {
  String uid;
  UpdateDays({this.uid});
  @override
  _UpdateDaysState createState() => _UpdateDaysState();
}

class _UpdateDaysState extends State<UpdateDays> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(body:

    StreamBuilder(
        stream: Firestore.instance.collection('Days').where(
            'uid', isEqualTo: widget.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot Snap) {
          if (!Snap.hasData) {
            return Container(child: Center(child: Text('Loading')));
          }
          else {
            return Container(child: ListView.builder(itemBuilder: (context,
                index) {
              return Card(child: Column(children: <Widget>[
                Text(Snap.data.documents[index]['name']),
                Row(children: <Widget>[
                  Text('from:'),
                  Text((Snap.data.documents[index]['start'] == '')
                      ? 'Holiday'
                      : Snap.data.documents[index]['start'])
                ],),
                Row(children: <Widget>[
                  Text('from:'),
                  Text((Snap.data.documents[index]['end'] == '')
                      ? 'Holiday'
                      : Snap.data.documents[index]['end'])
                ],),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(child: Text('Edit Day'), onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Updateday(uid:widget.uid,
                              start: Snap.data.documents[index]['start'],
                              end: Snap.data.documents[index]['end'],
                              name:Snap.data.documents[index]['name']);
                        }));
                      },)
                      ,
                      (Snap.data.documents[index]['end'] == ''||Snap.data.documents[index]['end'] == '')?Container():RaisedButton(
                        child: Text('Make This HoliDay'), onPressed: () {
                        Firestore.instance
                            .collection('Days').document(Snap.data.documents[index]['name']+widget.uid)
                            .updateData({
                          'start': '',
                          'end':'',

                        });
                        setState(() {
                          
                        });

                      },)
                    ])
              ],


              ));
            }, itemCount: 7,));
          }
        }));
  }

}