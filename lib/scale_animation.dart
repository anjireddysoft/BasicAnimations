import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({Key? key}) : super(key: key);

  @override
  ScaleAnimationState createState() => ScaleAnimationState();
}

class ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: _controller!, curve: Curves.bounceInOut);
    _controller!.forward();
    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
    });
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
              ScaleTransition(
                scale: animation!,
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
