// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(ClockApp());

class ClockApp extends StatelessWidget {
  const ClockApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock App',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Clock(),
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
                border: Border.all(width: 3),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Hour
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Transform.rotate(
                      angle: (_dateTime.hour * 30) * pi / 180,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: 3,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 2,
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Minutes
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Transform.rotate(
                      angle: (_dateTime.minute * 6) * pi / 180,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 2,
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Seconds
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Transform.rotate(
                      angle: (_dateTime.second * 6) * pi / 180,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 2,
                                  color: Colors.redAccent,
                                ),
                              ),
                              Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 2,
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 40,
            width: 200,
            color: Colors.teal,
            child: Text(
              "Digital clock",
              style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 45,
            width: 250,
            color: Colors.teal,
            child: Text(
              textAlign: TextAlign.center,
              '${_dateTime.hour} : ${_dateTime.minute.toString().padLeft(2, '0')} : ${_dateTime.second.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
