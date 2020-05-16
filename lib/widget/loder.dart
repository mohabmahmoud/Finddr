import 'package:flutter/material.dart';
import 'dart:math';
class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation_rotatoin;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;
  double raduis=0.0;
  final initraduis=30.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 5));
    animation_rotatoin=Tween<double>(
      begin:0.0,
      end:1.0,

    ).animate(CurvedAnimation(parent: controller,curve: Interval(0.0,1.0,curve: Curves.linear)));

    animation_radius_in=Tween<double>(
      begin:1.0,
      end:0.0,

    ).animate(CurvedAnimation(parent: controller,curve: Interval(0.75,1.0,curve: Curves.elasticIn)));

    animation_radius_out=Tween<double>(
      begin:0.0,
      end:1.0,

    ).animate(CurvedAnimation(parent: controller,curve: Interval(0.0,.25,curve: Curves.elasticOut)));

controller.addListener((){
  setState(() {
    if(controller.value>=0.75 && controller.value<=1.0){
      raduis = animation_radius_in.value*initraduis;
    }else if(controller.value>=0.0 && controller.value<=0.25){
      raduis = animation_radius_out.value*initraduis;


    }

  });

});
controller.repeat();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Center(
        child:RotationTransition(
        turns: animation_rotatoin,
        child: Stack(
          children: <Widget>[
            Dot(redius: 30.0,
            color: Colors.black12,),
        new Transform.translate(offset: Offset(raduis*cos(pi/4),raduis*sin(pi/4))

            ,child: Dot(redius: 5.0,
          color: Colors.lightBlueAccent,),
            )
        ,
            new Transform.translate(offset: Offset(raduis*cos(2*pi/4),raduis*sin(2*pi/4))

              ,child: Dot(redius: 5.0,
                color: Colors.redAccent,),
            ),
            new Transform.translate(offset: Offset(raduis*cos(3*pi/4),raduis*sin(3*pi/4))

              ,child: Dot(redius: 5.0,
                color: Colors.blue),
            ),
            new Transform.translate(offset: Offset(raduis*cos(4*pi/4),raduis*sin(4*pi/4))

              ,child: Dot(redius: 5.0,
                color: Colors.red,),
            ),
            new Transform.translate(offset: Offset(raduis*cos(5*pi/4),raduis*sin(5*pi/4))

              ,child: Dot(redius: 5.0,
                color: Colors.yellowAccent,),
            ), new Transform.translate(offset: Offset(raduis*cos(6*pi/4),raduis*sin(6*pi/4))

              ,child: Dot(redius: 5.0,
                color: Colors.brown,),
            ), new Transform.translate(offset: Offset(raduis*cos(7*pi/4),raduis*sin(7*pi/4))

              ,child: Dot(redius: 5.0,
                color: Colors.greenAccent,),
            ), new Transform.translate(offset: Offset(raduis*cos(8*pi/4),raduis*sin(8*pi/4))

              ,child: Dot(redius: 5.0,
                color: Colors.black12,),
            ),

          ],
        ),
      )),
    );
  }

}
class Dot extends StatelessWidget {
  final double redius;
  final Color color;
  Dot({this.color,this.redius});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      width: this.redius,
      height: this.redius,
      decoration: BoxDecoration(
        color: this.color,
        shape: BoxShape.circle,
      ),
    ));
  }
}

