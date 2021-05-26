

import 'package:flutter/material.dart';
/// 如何获取Flutter应用维度的生命周期}|
/// WidgetsBindingObserver: 是一个widgets绑定观察器, 通过它我们可以监听应用的生命周期, 语言的变化

class AppLifecycle extends StatefulWidget {
  const AppLifecycle({Key key}) : super(key: key);

  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver{
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
      super.didChangeAppLifecycleState(state);
      print('state=$state');
      if (state == AppLifecycleState.paused) {
        print('进入后台');
      } else if (state == AppLifecycleState.resumed) {
        print('进入前台');
      } else if (state == AppLifecycleState.inactive) {
        //不常用: 应用程序处于非活动状态, 并且未接收用户输入时调用, 比如: 来了个电话
        print('非活动状态');
      }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
