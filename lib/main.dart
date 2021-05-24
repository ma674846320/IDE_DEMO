import 'package:demo1/demo.dart';
import 'package:demo1/less_group_page.dart';
import 'package:demo1/plugin_use.dart';
import 'package:demo1/state_less_widget.dart';
import 'package:demo1/statefull_group_page.dart';
import 'package:flutter/material.dart';

void main() {
  ///runApp(MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // _function();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('如何创建使用Flutter的路由与导航')),
          body: RouteNavigator(),
        ),
        routes: <String, WidgetBuilder>{
          'plugin': (BuildContext context) => PluginUse(),
          'layout': (BuildContext context) => LessGroupPage(),
          'ful': (BuildContext context) => StateFulGroup(),
          'less': (BuildContext context) => StateLessWidget(),
        });
  }

  void _function() {
    TestFunction testFunction = TestFunction();
    testFunction.start();
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SwitchListTile(
              title: Text('${byName ? '' : '不'}通过路由跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('如何使用Flutter包和插件', PluginUse(), 'plugin'),
          _item('StatelessWidget与基础组件', StateLessWidget(), 'less'),
          _item('StateFulWidhet与基础组件', StateFulGroup(), 'ful'),
          _item('布局开发', LessGroupPage(), 'layout'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
