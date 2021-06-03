import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(LogoAppWidget());

class LogoAppWidget extends StatefulWidget {
  @override
  _LogoAppWidgetState createState() => _LogoAppWidgetState();
}

class AnimatedLogo extends AnimatedWidget{
  AnimatedLogo({Key key, Animation<double> animation})
      :super(key:key, listenable:animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
  
}

class _LogoAppWidgetState extends State<LogoAppWidget> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
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
      body: AnimatedLogo(animation: animation),
    );
  }
}
