import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildStack() {
    return Stack(
      children: [
        Positioned(
            left: 20.0,
            top: 20.0,
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.indigo,
            )),
        Positioned(
          left: 100.0,
          top: 100.0,
          right: 100.0,
          bottom: 200.0,
          child: Container(
            color: Colors.cyan,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildStack(),
    );
  }
}
