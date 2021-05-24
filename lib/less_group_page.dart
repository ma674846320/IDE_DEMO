import 'package:demo1/demo.dart';
import 'package:demo1/plugin_use.dart';
import 'package:demo1/state_less_widget.dart';
import 'package:flutter/material.dart';

void main() {
  ///runApp(MyApp());
  runApp(StateLessWidget());
}

///StatefullWidget与基础组件
class LessGroupPage extends StatefulWidget {
  const LessGroupPage({Key key}) : super(key: key);

  @override
  _LessGroupPageState createState() => _LessGroupPageState();
}

class _LessGroupPageState extends State<LessGroupPage> {
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
          title: Text('StateLessWidget与基础组件123'),
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
        body: _currentIndex == 0
            ? Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.white),
                child: ListView(
                  children: [
                    Column(
                      children: <Widget>[
                        Row(
                          children: [
                            ClipOval(
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.network(
                                    'https://wegame.gtimg.com/g.2000564-r.f6574/adm/16212450923882.png',
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                //圆角
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Opacity(
                                  opacity: 0.6,
                                  child: Image.network(
                                    'https://wegame.gtimg.com/g.2000717-r.2feb0/adm/16215823643882.jpeg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            FractionallySizedBox(
                              widthFactor: 1,
                              child: Container(
                                decoration: BoxDecoration(color: Colors.red),
                                child: Text('123'),
                              ),
                            ),
                          ],
                        ),
                        Text('I am Text', style: textStyle),
                        Icon(
                          Icons.android,
                          size: 50,
                          color: Colors.red,
                        ),
                        CloseButton(),
                        BackButton(),
                        Chip(
                            avatar: Icon(Icons.people),
                            label: Text('123123123')),
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
                            child: Text(
                              '321321',
                              style: textStyle,
                            ),
                          ),
                        ),
                        AlertDialog(
                          title: Text('那我走123?'),
                          content: Text('李某: 唉~'),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Image.network(
                          'https://wegame.gtimg.com/g.2000717-r.2feb0/adm/16215823643882.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image.network(
                            'https://wegame.gtimg.com/g.2000717-r.2feb0/adm/16215823643882.jpeg',
                            width: 36,
                            height: 36,
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _chip('asd'),
                        _chip('qwe'),
                        _chip('zxc'),
                        _chip('rty'),
                        _chip('yui'),
                        _chip('ghj'),
                      ],
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Text('分隔'),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text('填充123123'),
                  ))
                ],
              ),
      ),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.greenAccent.shade700,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
