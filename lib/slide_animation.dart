import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({Key? key}) : super(key: key);

  @override
  SlideAnimationState createState() => SlideAnimationState();
}

class SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<Offset>(begin: Offset(0.0,0.0),end: Offset(1.0,0.0)).animate(_controller!) as Animation<Offset>?;
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
              SlideTransition(
               position: animation!,
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
