import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Updateday extends StatefulWidget {
  String uid;
  String end;
  String start;
  String name;
  Updateday({this.uid,this.start,this.end,this.name});
  @override
  _UpdatedayState createState() => _UpdatedayState();
}

class _UpdatedayState extends State<Updateday> {
  String start;
  String end;
  @override
  Widget build(BuildContext context) {
    if(widget.start!=''){
      start=widget.start;
    }
    if(widget.end!=''){
      end=widget.end;
    }
    return Scaffold(bottomNavigationBar:Container(child:RaisedButton(color: Theme.of(context).primaryColor,child: Text('Save Day',style: TextStyle(color: Colors.white),),onPressed: (){
      Firestore.instance
          .collection('Days').document(widget.name+widget.uid)
          .updateData({
        'start': start,
        'end':end,

      });

    })),appBar: AppBar(title: Text(widget.name),centerTitle: true,),body: Container(
      child: Center(child: Column(children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 30,bottom: 20),child:Text('Stat time:')),
      Container(
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.blueGrey)),
      child:
      ListTile(leading: Icon(Icons.date_range),title:

      new DropdownButtonHideUnderline(child:DropdownButton<String>(
      value: start,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            start = newValue;
          });
        },
        items: <String>['00:00','01:00',
          '02:00', '03:00','04:00','05:00',
          '06:00', '07:00','08:00','09:00',
          '10:00', '11:00','12:00','13:00',
          '14:00', '15:00','16:00','17:00',
          '18:00', '19:00','20:00','21:00',
          '22:00', '23:00','24:00']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      )))),
        Padding(padding: EdgeInsets.only(top: 30,bottom: 20),child:Text('End time:')),
        Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(color: Colors.blueGrey)),
            child:
            ListTile(leading: Icon(Icons.date_range),title:

            new DropdownButtonHideUnderline(child:DropdownButton<String>(
              value: end,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  end = newValue;
                });
              },
              items: <String>['00:00','01:00',
                '02:00', '03:00','04:00','05:00',
                '06:00', '07:00','08:00','09:00',
                '10:00', '11:00','12:00','13:00',
                '14:00', '15:00','16:00','17:00',
                '18:00', '19:00','20:00','21:00',
                '22:00', '23:00','24:00']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )))),
      ],),),
    ),);
  }
}
