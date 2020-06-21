import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(WorkoutClock());

class WorkoutClock extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Clock',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: WorkoutClockPage(title: 'Workout Clock'),
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
  DateTime _diff = DateTime(2020);

  void _onTimer(Timer timer) {
    final now = DateTime.now();
    final diff = DateTime(2020).add(now.difference(_temp));
    setState(() {
      _now = now;
      _diff = diff;
    });
  }

  _handlePressed() {
    _temp = DateTime.now();
  }

  _pad02(n) {
    return n.toString().padLeft(2, "0");
  }

  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 100), _onTimer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _mainTextStyle = TextStyle(fontSize: 150, fontWeight: FontWeight.bold, color: Colors.green);
    var stopTextStyle = TextStyle(fontSize: 90, fontWeight: FontWeight.bold, color: Colors.black);
    var diffTextStyle = TextStyle(fontSize: 150, fontWeight: FontWeight.bold, color: Colors.blue);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _handlePressed,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('${_pad02(_now.hour)}', style: _mainTextStyle),
                    Text('${_pad02(_diff.hour)}', style: diffTextStyle),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('${_pad02(_now.minute)}', style: _mainTextStyle),
                    Text('${_pad02(_diff.minute)}', style: diffTextStyle),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('${_pad02(_now.second)}', style: _mainTextStyle),
                    Text('${_pad02(_diff.second)}', style: diffTextStyle),
                  ]),
              Text('${_pad02(_temp.hour)}:${_pad02(_temp.minute)}:${_pad02(_temp.second)}', style: stopTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
