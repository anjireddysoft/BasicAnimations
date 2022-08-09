import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  const SizeAnimation({Key? key}) : super(key: key);

  @override
  SizeAnimationState createState() => SizeAnimationState();
}

class SizeAnimationState extends State<SizeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: _controller!, curve: Curves.bounceInOut);
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
              SizeTransition(
                sizeFactor: animation!,
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ));
  }
}
