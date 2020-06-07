import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finddoctor/Constants/widthandheight.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Editmydata extends StatefulWidget {
  String uid;
  Editmydata({this.uid});
  @override
  _EditmydataState createState() => _EditmydataState();
}

class _EditmydataState extends State<Editmydata> {

  TextEditingController nameCont=new TextEditingController();
  TextEditingController addressCont=new TextEditingController();
  TextEditingController descriptionCont=new TextEditingController();
  TextEditingController phoneCont=new TextEditingController();
  TextEditingController priceCont=new TextEditingController();



var image=null;

  @override
  Widget build(BuildContext context) {return Scaffold(body:

  StreamBuilder(
      stream: Firestore.instance.collection('Users').where('uid',isEqualTo: widget.uid).snapshots(),
    builder: (BuildContext context, AsyncSnapshot Snap) {
  if (!Snap.hasData) {
  return Container(child: Center(child: Text('Loading')));

  }
  else {
  print(Snap.data.documents);

  nameCont.text=Snap.data.documents[0]['name'];
  addressCont.text=Snap.data.documents[0]['address'];
  phoneCont.text=Snap.data.documents[0]['phone'];
  descriptionCont.text=Snap.data.documents[0]['description'];
  priceCont.text=Snap.data.documents[0]['price'].toString();




  return Container(child:
  Container(child: ListView(children: <Widget>[

  SizedBox(height: 20,),
  InkWell(child: Container(height: getheight(context)/4,child:Center(child:
  Container(height: 200,width:200,child:CircleAvatar(backgroundImage:NetworkImage('https://firebasestorage.googleapis.com/v0/b/finddr-9761c.appspot.com/o/'+Snap.data.documents[0]['image']+'?alt=media&token=f45864f5-6a86-468d-9b32-b1069743365b',))),)),
  onTap: ()async{
    getimage();
  },),
    SizedBox(height: 20,),

  Padding(padding: EdgeInsets.only(left: 10,right: 10),
  child:TextField(controller: nameCont
  ,style:
  TextStyle(fontFamily: 'mohab'),
  decoration: InputDecoration(prefixIcon: Icon(Icons.person),
  prefixText: 'Doctor Name:',
  suffixStyle: TextStyle(fontFamily: 'mohab'),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),

  )
  ),)),
  SizedBox(height: 20,),
  Padding(padding: EdgeInsets.only(left: 10,right: 10),
  child:TextField(controller: descriptionCont,style:
  TextStyle(fontFamily: 'mohab'),
  decoration: InputDecoration(prefixIcon: Icon(Icons.insert_drive_file),
  prefixText: 'Description:',
  suffixStyle: TextStyle(fontFamily: 'mohab'),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),

  )
  ),)),
  SizedBox(height: 20,),
  Padding(padding: EdgeInsets.only(left: 10,right: 10),
  child:TextField(controller: addressCont
  ,style:
  TextStyle(fontFamily: 'mohab'),
  decoration: InputDecoration(
  prefixIcon: Icon(Icons.location_on),
  prefixText: 'Address:',
  suffixStyle: TextStyle(fontFamily: 'mohab'),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),

  )
  ),)),

  SizedBox(height: 20,),
  Padding(padding: EdgeInsets.only(left: 10,right: 10),
  child:TextField(controller: priceCont,style:
  TextStyle(fontFamily: 'mohab'),
  decoration: InputDecoration(prefixIcon: Icon(Icons.monetization_on),
  prefixText: 'price:',
  suffixStyle: TextStyle(fontFamily: 'mohab'),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),

  )
  ),)),
  SizedBox(height: 20,),
  Padding(padding: EdgeInsets.only(left: 10,right: 10),
  child:
  TextField(controller: phoneCont
  ,style:
  TextStyle(fontFamily: 'mohab'),
  decoration: InputDecoration(
  prefixIcon: Icon(Icons.phone),
  prefixText: 'Phone:',
  suffixStyle: TextStyle(fontFamily: 'mohab'),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),

  )
  ),)),
  SizedBox(height: 20,),


  Container(
  padding: EdgeInsets.symmetric(vertical: 25.0),
  width: double.infinity,
  child: RaisedButton(
  elevation: 5.0,
  onPressed:() {
    Firestore.instance
        .collection('Users')
        .document(widget.uid)
        .updateData({
      'address': addressCont.text,
      'name':nameCont.text,
      'price':priceCont.text,
      'phone':phoneCont.text,
      'description':descriptionCont.text,
    });
  },
  padding: EdgeInsets.all(15.0),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30.0),
  ),
  color: Theme.of(context).primaryColor,
  child:
  Text(
  'Save information',
  style: TextStyle(
  color: Colors.white,

  letterSpacing: 1.5,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'mohab',
  ),
  ),
  ),
  )



  ],),),);
  }

  }));



      }



     Future getimage()async{
    String imagename;
    File tempimage=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image=tempimage;

      imagename=tempimage.path.split('/')[6];
    });
    var dateTime=new DateTime.now().microsecond;
    final StorageReference storageReference=FirebaseStorage.instance.ref().child(imagename);
     StorageUploadTask task;
    Firestore.instance
        .collection('Users')
        .document(widget.uid)
        .updateData({
      'image': imagename,
    }).then((ov){

       task=storageReference.putFile(image);

    });


      }
      @override
  void dispose() {
    nameCont.dispose();
    phoneCont.dispose();
    descriptionCont.dispose();
    addressCont.dispose();
    // TODO: implement dispose
    super.dispose();
  }

}
