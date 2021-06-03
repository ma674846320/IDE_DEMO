import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(LogoAppBuilder());

class LogoAppBuilder extends StatefulWidget {
  @override
  _LogoAppBuilderState createState() => _LogoAppBuilderState();
}

class LogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
        child: child,
    );
  }
}

class _LogoAppBuilderState extends State<LogoAppBuilder>
    with SingleTickerProviderStateMixin {
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
      body: GrowTransition(animation: animation,child:LogWidget()),
    );
  }
}
