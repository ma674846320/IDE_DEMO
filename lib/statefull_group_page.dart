import 'package:demo1/demo.dart';
import 'package:demo1/plugin_use.dart';
import 'package:demo1/state_less_widget.dart';
import 'package:flutter/material.dart';

void main() {
  ///runApp(MyApp());
  runApp(StateLessWidget());
}

///StatefullWidget与基础组件
class StateFulGroup extends StatefulWidget {
  const StateFulGroup({Key key}) : super(key: key);

  @override
  _StateFulGroupState createState() => _StateFulGroupState();
}

class _StateFulGroupState extends State<StateFulGroup> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);

    return MaterialApp(
      title: 'StatefulWidget',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StateLessWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  label: '首页'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.list, color: Colors.blue),
                  label: '列表')
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://image.awehome.com/data/uploads/hot-school/MTU2MDczNzEzMy05MjI=.jpg',
                            width: 100,
                            height: 100,
                          ),
                          TextField(
                            //输入样式
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText: '请输入',
                              hintStyle: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            height: 200,
                            margin: EdgeInsets.only(top: 10),
                            decoration:
                                BoxDecoration(color: Colors.lightBlueAccent),
                            child: PageView(
                              children: [
                                _image(
                                    'https://image.awehome.com/data/uploads/hot-school/MTU2MDczNzEzMy05MjI=.jpg'),
                                _item('Page1', Colors.deepPurple),
                                _item('Page2', Colors.greenAccent),
                                _item('Page3', Colors.red),
                                _item('Page4', Colors.deepOrangeAccent)
                              ],
                            ),
                          ),
                          /*Text('I am Text', style: textStyle),
                  Icon(Icons.android,size: 50,color: Colors.red,),
                  CloseButton(),
                  BackButton(),
                  Chip(
                      avatar: Icon(Icons.people),
                      label: Text('123123123')
                  ),
                  Divider(
                    height: 10,
                    indent: 10,
                    color: Colors.orange,
                  ),
                  Card(
                    color: Colors.blue,
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text('321321',style: textStyle,),
                    ),
                  ),
                  AlertDialog(
                    title: Text('那我走?'),
                    content: Text('李某: 唉~'),
                  ),*/
                        ],
                      ),
                    )
                  ],
                ),
                onRefresh: _handleRefresh)
            : Text('列表页'),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 22, color: Colors.white)),
    );
  }

  _image(String src) {
    return Image.network(
      src,
      fit: BoxFit.cover,
    );
  }
}
