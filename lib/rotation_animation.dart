import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({Key? key}) : super(key: key);

  @override
  RotationAnimationState createState() => RotationAnimationState();
}

class RotationAnimationState extends State<RotationAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: _controller!, curve: Curves.bounceInOut);
    // it will repeat the rotation continuously
    _controller!.repeat();
    /*_controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: animation!,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ));
  }
}
