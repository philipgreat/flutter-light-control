# fluttershow

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



###1. 后台服务 LightControl实现http请求
###2. 外框MyApp实现一个外框
###3. 一个包含状态的MyHomePage，在_MyHomePageState里面实现状态控制


## Code

```

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());



class LightControl {
  //http://192.168.0.1/cgi-bin/toggle

  Future<String> _toggleLight() {
    final url = 'http://192.168.0.1/cgi-bin/toggle';
    return http.get(url).then((response) {
      String status = response.body;
      return status;
    });
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: '灯光控制'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  String _lastStatus="--";
  void handleContent(String content){

      print(content);
      if(content.contains("off")){
        setState(()  {_lastStatus = "OFF";});
      }else{
        setState(() {_lastStatus = "ON";});
      }



  }
  void _toggleLight() {

    final lightControl = new LightControl();
    //lightControl._toggleLight();

    lightControl._toggleLight()
        .then((content) => handleContent(content))
        .catchError((error) => print(error));


  }
  Widget calcIcon(BuildContext context, String ligthStatus){
    if(ligthStatus=="ON"){
      return Icon(Icons.lightbulb_outline);
    }
    if(ligthStatus=="OFF"){
      return Icon(Icons.add);
    }
    return Icon(Icons.device_unknown);

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              '当前状态:',
            ),
            Text(
              '$_lastStatus',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleLight,
        tooltip: '开或者关',
        child: calcIcon(context,_lastStatus),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


```
