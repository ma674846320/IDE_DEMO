import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.reset();
                controller.forward();
              },
              child: Text('Start', textDirection: TextDirection.ltr),
            ),
            Text(
              'State:' + animationStatus.toString(),
              textDirection: TextDirection.ltr,
            ),
            Text(
              'Value:' + animationValue.toString(),
              textDirection: TextDirection.ltr,
            ),
            Container(
              height: animationValue,
              width: animation.value,
              child: FlutterLogo(),
            ),
          ],
        ),
      ),
    );
  }
}
