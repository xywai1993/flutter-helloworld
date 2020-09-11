import 'dart:ffi';

import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter2222 '),
    );
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

class Li extends StatefulWidget {
  Li({Key key, this.title, this.isChecked, this.remove}) : super(key: key);

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
        // Checkbox(
        //     value: _checkboxstatic,
        //     onChanged: (val) {
        //       if (val) {
        //         widget.remove();
        //       }
        //       setState(() {
        //         _checkboxstatic = val;
        //       });
        //     }),
        Text(
          widget.title,
          style: TextStyle(
              color: Color.fromRGBO(255, 0, 0, 1),
              decoration: _checkboxstatic == true
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        FlatButton(
            onPressed: widget.remove,
            child: Text(_checkboxstatic ? '重做' : '已完成'))
      ],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List todoList = [];
  List history = [];

  List<Widget> _getData() {
    List<Widget> list = new List();

    for (int i = 0; i < todoList.length; i++) {
      list.add(Li(
        title: todoList[i],
        isChecked: false,
        remove: () {
          // print(i);
          // var a = todoList[i];
          setState(() {
            history.add(todoList[i]);
            todoList.removeAt(i);
          });
        },
      ));
    }
    return list;
  }

  List<Widget> _getHistory() {
    List<Widget> list = new List();

    for (int i = 0; i < history.length; i++) {
      list.add(Li(
        title: history[i],
        isChecked: true,
        remove: () {
          // print(i);
          setState(() {
            todoList.add(history[i]);
            history.removeAt(i);
          });
        },
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

      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).

            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 100,
                color: Color.fromRGBO(255, 0, 0, 1),
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'todoList',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 30),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                    controller: _todoInput,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "做点什么",
                        hintText: "您要做什么",
                        prefixIcon: Icon(Icons.add_alarm)),
                    // onChanged: (v) {
                    //   print("onChange: $v");
                    // },
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      print(_todoInput.text.isEmpty);
                      if (_todoInput.text.isEmpty) {
                        return;
                      }
                      setState(() {
                        todoList.add(_todoInput.text);
                        _todoInput.text = '';
                      });
                    }),
              ),
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("Submit"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  if (_todoInput.text.isEmpty) {
                    return;
                  }
                  setState(() {
                    todoList.add(_todoInput.text);
                    _todoInput.text = '';
                  });
                },
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text('todo ${_getData().length}'),
              Container(
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: _getData(),
                ),
              ),
              Text('历史记录 ${_getHistory().length}'),
              Container(
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: _getHistory(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
