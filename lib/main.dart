import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'mine_page.dart';
import 'nav.dart' as nav;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo222',
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
          primarySwatch: Colors.green,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: '翻牌子 '),
        routes: {
          '/home': (BuildContext context) => MyHomePage(
                title: '122',
              ),
          '/mine': (BuildContext context) => MinePage()
        },
        initialRoute: '/home');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectIndex = 0;
  List todoList = [
    {'checked': false, 'content': '12345'}
  ];
  List history = [];

  List<Widget> _getData() {
    List<Widget> list = [];

    for (int i = 0; i < todoList.length; i++) {
      print('$i:${todoList[i]['checked']}');
      list.add(Li(
        index: i,
        title: todoList[i]['content'],
        isChecked: todoList[i]['checked'],
        remove: (val) {
          print(val);
          setState(() {
            // history.add(todoList[i]);
            // todoList.removeAt(i);
            todoList[i]['checked'] = val;
          });
        },
      ));
    }
    return list;
  }

  List<Widget> _getHistory() {
    List<Widget> list = [];

    for (int i = 0; i < history.length; i++) {
      list.add(Li(
        index: i,
        title: history[i],
        isChecked: true,
        remove: () {
          // print(i);
          setState(() {
            todoList.insert(0, history[i]);
            history.removeAt(i);
          });
        },
      ));
    }
    return list;
  }

  List<Widget> _getBox() {
    List<Widget> list = [];
    for (int i = 0; i < 9; i++) {
      list.add(GestureDetector(
        onTap: () {
          print('super$i');
        },
        child: Container(
            margin: EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Colors.green[50],
            alignment: AlignmentDirectional.center,
            child: Text('点我')),
      ));
    }

    return list;
  }

  TextEditingController _todoInput = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void addTodoList() {
    if (_todoInput.text.isEmpty) {
      return;
    }
    final obj = {'checked': false, 'content': _todoInput.text};
    setState(() {
      todoList.insert(0, obj);
      _todoInput.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      bottomNavigationBar: nav.bottom_nav(context, 0),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // body: SingleChildScrollView(
      //   child: Column(children: [
      //     Expanded(child: Container(
      //     color: Colors.black45,
      //     alignment: Alignment.center,
      //     child: Wrap(
      //       // crossAxisAlignment: WrapCrossAlignment.center,
      //       children: _getBox(),
      //     ),
      //   ),
      // )
      //   ],),
      body: Flex(
        children: [
          Expanded(
              child: Container(
                  color: Colors.red[300],
                  alignment: Alignment.center,
                  child: Wrap(
                    // crossAxisAlignment: WrapCrossAlignment.center,
                    children: _getBox(),
                  )))
        ],
        direction: Axis.vertical,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Li extends StatefulWidget {
  Li({Key key, this.index, this.title, this.isChecked, this.remove})
      : super(key: key);

  final int index;
  final String title;
  final bool isChecked;
  final Function remove;
  @override
  State<StatefulWidget> createState() {
    return _LiState();
  }
}

class _LiState extends State<Li> {
  bool _checkboxstatic;

  @override
  void initState() {
    super.initState();

    _checkboxstatic = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
            value: _checkboxstatic,
            onChanged: (val) {
              // if (val) {
              //   widget.remove();
              // }
              widget.remove(val);
              setState(() {
                _checkboxstatic = val;
              });
            }),
        Text(
          '${widget.index + 1}、 ${widget.title}',
          style: TextStyle(
              color: Color.fromRGBO(255, 0, 0, 1),
              decoration: _checkboxstatic == true
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        // FlatButton(
        //     onPressed: widget.remove,
        //     child: Text(_checkboxstatic ? '重做' : '完成'))
      ],
    );
  }
}
