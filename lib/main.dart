
import 'package:flutter/material.dart';
import 'package:flutteranimations/fade_animation.dart';
import 'package:flutteranimations/rotation_animation.dart';
import 'package:flutteranimations/scale_animation.dart';
import 'package:flutteranimations/size_animation.dart';
import 'package:flutteranimations/slide_animation.dart';

void main() {
  runApp(const MaterialApp(home:  MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const RotationAnimation();
  }
}
