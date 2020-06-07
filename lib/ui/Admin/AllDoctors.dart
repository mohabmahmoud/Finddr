import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finddoctor/ui/Admin/AddDoctor.dart';
import 'package:finddoctor/widget/loder.dart';
import 'package:flutter/material.dart';
class Doctors extends StatefulWidget {
  String uid;
  Doctors({this.uid});
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  TextEditingController ADDnew = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add), onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return AddDocotor();
    }));
    },), body:


    StreamBuilder(
      stream: Firestore.instance.collection('Users').where('rank',isEqualTo: 2).snapshots(),
      builder: (BuildContext context, AsyncSnapshot Snap) {
        if (!Snap.hasData) {
          return Container(child: Center(child: Text('Loading')));

        }
        else {
          print(Snap.data.documents);
          return Container(child:
          ListView.builder(itemCount: Snap.data.documents.length, itemBuilder: (context, index) {
            return ListTile(leading: CircleAvatar(backgroundImage:
            NetworkImage('https://firebasestorage.googleapis.com/v0/b/finddr-9761c.appspot.com/o/'+Snap.data.documents[index]['image']+'?alt=media&token=f45864f5-6a86-468d-9b32-b1069743365b',

                ),),
              title: Text(Snap.data.documents[index]['name']),
              trailing: IconButton(
                icon: Icon(Icons.delete_forever, color: Colors.red,),onPressed: (){






                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Delete "),
                        content: Text(Snap.data.documents[index]['name']),
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
                              Firestore.instance.collection('Users')
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