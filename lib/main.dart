import 'package:demo1/app_lifecycle.dart';
import 'package:demo1/demo.dart';
import 'package:demo1/flutter_widget_lifecycle.dart';
import 'package:demo1/gesture_page.dart';
import 'package:demo1/launch_page.dart';
import 'package:demo1/less_group_page.dart';
import 'package:demo1/photo_app_page.dart';
import 'package:demo1/plugin_use.dart';
import 'package:demo1/res_page.dart';
import 'package:demo1/state_less_widget.dart';
import 'package:demo1/statefull_group_page.dart';
import 'package:flutter/material.dart';

void main() {
  ///runApp(MyApp());
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  const DynamicTheme({Key key}) : super(key: key);

  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    // _function();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // fontFamily: 'glyphicons', // 将该字体应用到全局
          brightness: _brightness,
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('如何创建使用Flutter的路由与导航')),
          body: Column(
            children: [
              RaisedButton(onPressed: (){
                  setState(() {
                    if (_brightness==Brightness.dark) {
                      _brightness = Brightness.light;
                    } else {
                      _brightness = Brightness.dark;
                    }
                  });
              },
              child: Text('主题切换abc',style: TextStyle(fontFamily: 'glyphicons'),),
              ),
              RouteNavigator()
            ],
          ),
        ),
        routes: <String, WidgetBuilder>{
          'plugin': (BuildContext context) => PluginUse(),
          'layout': (BuildContext context) => LessGroupPage(),
          'ful': (BuildContext context) => StateFulGroup(),
          'less': (BuildContext context) => StateLessWidget(),
          'gensture': (BuildContext context) => GesturePage(),
          'respage': (BuildContext context) => ResPage(),
          'launchpage': (BuildContext context) => LaunchPage(),
          'widgetlifecycle': (BuildContext context) => WidgetLifecycle(),
          'applifecycle': (BuildContext context) => AppLifecycle(),
          'photoapp': (BuildContext context) => PhotoApp(),
        });
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
          _item('如何检测用户手势以及处理点击事件', GesturePage(), 'gensture'),
          _item('如何使用Fultter图片资源', ResPage(), 'respage'),
          _item('如何打开第三方应用', LaunchPage(), 'launchpage'),
          _item('Flutter的生命周期', WidgetLifecycle(), 'widgetlifecycle'),
          _item('app应用的生命周期', AppLifecycle(), 'applifecycle'),
          _item('拍照app', PhotoApp(), 'photoapp'),
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
