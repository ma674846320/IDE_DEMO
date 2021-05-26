import 'package:flutter/material.dart';

/// 1. 初始化时期
/// createState, initState
/// 2. 更新期间
/// didChangeDependencies, build, didUpdateWidget
/// 3. 销毁期
/// deactivete, dispose

class WidgetLifecycle extends StatefulWidget {
  const WidgetLifecycle({Key key}) : super(key: key);

  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  /// 这是创建widget时调用的除构造方法外的第一个方法;
  @override
  void initState() {
    print('---initState---');
    super.initState();
  }

  /// 当依赖的State的对象改变时会调用
  /// a.在第一次构建widget时, 在initState()之后立即调用此方法
  /// b.如果StatefulWidgets依赖于InheritedWidget, 那么当当前State所依赖InheritedWidget中的变量改变时会再次调用它
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('---didChangeDependencies---');
    super.didChangeDependencies();
  }

  ///这是一个必须实现的方法, 在这里实现你要呈现的页面内容
  ///它会在didChangeDependencies()之后立即调用
  ///另外当调用setState后也会再次调用该方法
  @override
  Widget build(BuildContext context) {
    print('---build---');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter页面生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(onPressed: () {
              setState(() {
                _count++;
              });
            }
            ,child: Text('点我',style: TextStyle(fontSize: 26),),
            ),
            Text(_count.toString())
          ],
        ),
      ),
    );
  }

  /// 这是一个不常用的周期方法, 当父组件需要重新绘制时才会调用;
  /// 该方法会携带一个oldWidget参数, 可以将其与当前的widget进行对比以便执行一些额外的逻辑
  /// if (oldWidget.xxx != widget.xxx)...
  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
      print('---didUpdateWidget---');
      super.didUpdateWidget(oldWidget);
  }

  /// 很少使用, 在组件被移除时调用调用在dispose之前调用
  @override
  void deactivate() {
    print('---deactivate---');
    super.deactivate();
  }

  /// 常用, 组件呗销毁时调用
  /// 通常在该方法中执行一些资源的释放工作比如, 监听器的卸载, channel的销毁等
  @override
  void dispose() {
    print('---dispose---');
    super.dispose();
  }
}
