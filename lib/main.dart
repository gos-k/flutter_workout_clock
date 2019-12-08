import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(WorkoutClock());

class WorkoutClock extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Workout Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WorkoutClockPage(title: 'Flutter Workout Clock Home Page'),
    );
  }
}

class WorkoutClockPage extends StatefulWidget {
  WorkoutClockPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WorkoutClockPageState createState() => _WorkoutClockPageState();
}

class _WorkoutClockPageState extends State<WorkoutClockPage> {
  DateTime _now = DateTime.now();
  DateTime _temp = DateTime.now();

  void _onTimer(Timer timer) {
    setState(() {
      _now = DateTime.now();
    });
  }

  _handlePressed() {
    _temp = DateTime.now();
  }

  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 100), _onTimer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _textStyle = TextStyle(fontSize: 150, fontWeight: FontWeight.bold, color: Colors.green);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${_now.hour}', style: _textStyle),
            Text('${_now.minute}', style: _textStyle),
            Text('${_now.second}', style: _textStyle),
            Text('${_temp.hour}:${_temp.minute}:${_temp.second}', style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Colors.black)),
            FlatButton(
              onPressed: _handlePressed,
              color: Colors.red,
              child: Text(
                'Snap',
              )
            )
          ],
        ),
      ),
    );
  }
}
