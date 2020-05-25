import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finddoctor/widget/loder.dart';
import 'package:flutter/material.dart';
class Users extends StatefulWidget {
  String uid;
  Users({this.uid});
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  TextEditingController ADDnew = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: StreamBuilder(
      stream: Firestore.instance.collection('Users').where('rank',isEqualTo: 3).snapshots(),
      builder: (BuildContext context, AsyncSnapshot Snap) {
        if (!Snap.hasData) {
          return Container(child: Center(child: Text('Loading')));

        }
        else {
          print(Snap.data.documents);
          return Container(child:
          ListView.builder(itemCount: Snap.data.documents.length, itemBuilder: (context, index) {
            return ListTile(leading: Icon(Icons.person, color: Colors.blue,),
              title: Text(Snap.data.documents[index]['name']),
              trailing: IconButton(
                icon: Icon(Icons.delete_forever, color: Colors.red,),onPressed: (){






                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Delete "),
                        content: Text(Snap.data.documents[index]['Gaverenment']),
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