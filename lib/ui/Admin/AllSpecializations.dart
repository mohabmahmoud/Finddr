import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finddoctor/widget/loder.dart';
import 'package:flutter/material.dart';
class Specializations extends StatefulWidget {
  String uid;
  Specializations({this.uid});
  @override
  _SpecializationsState createState() => _SpecializationsState();
}

class _SpecializationsState extends State<Specializations> {
  TextEditingController ADDnew = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add), onPressed: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Add New "),
              content: TextField(
                onChanged: (email) {},
                controller: ADDnew,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.place,
                    color: Colors.blue,
                  ),
                  hintText: 'New Specializations',
                ),
              ),
              actions: [
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("Add"),
                  onPressed: () {
                    Firestore.instance.collection('Specializations')
                        .document()
                        .setData({
                      'specializationname': ADDnew.text,
                    })
                        .then((res) {
                      print('mmmmm');
                      Navigator.of(context).pop();
                    });
                  },
                ),

              ],
            );
          });
    },), body: StreamBuilder(
      stream: Firestore.instance.collection('Specializations').snapshots(),
      builder: (BuildContext context, AsyncSnapshot Snap) {
        if (!Snap.hasData) {
          return Container(child: Center(child: Text('Loading')));

        }
        else {
          print(Snap.data.documents);
          return Container(child:
          ListView.builder(itemCount: Snap.data.documents.length, itemBuilder: (context, index) {
            return ListTile(leading: Icon(Icons.control_point, color: Colors.red,),
              title: Text(Snap.data.documents[index]['specializationname']),
              trailing: IconButton(
                icon: Icon(Icons.delete_forever, color: Colors.red,),onPressed: (){

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Delete "),
                        content: Text(Snap.data.documents[index]['specializationname']),
                        actions: [
                          FlatButton(
                            child: Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text("delete",style: TextStyle(color: Colors.red),),
                            onPressed: () {
                              Firestore.instance.collection('Specializations')
                                  .document(Snap.data.documents[index].documentID).delete()
                                  .then((res) {
                                print('delete');
                                Navigator.of(context).pop();
                              });
                            },
                          ),

                        ],
                      );
                    });











              },),);
          }),);
        }
      },)


      ,);
  }

}