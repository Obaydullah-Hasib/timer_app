import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:timer_app_rashad_vai/widget/TabBarMethod.dart';
import 'package:timer_app_rashad_vai/widget/buildCupertinoTimerPicker.dart';
import 'package:timer_app_rashad_vai/widget/icon_button_custom.dart';

import '../utilis/utils.dart';
import '../widget/stopwatch.dart';

class QuickTimer extends StatefulWidget {
  const QuickTimer({Key? key}) : super(key: key);

  @override
  State<QuickTimer> createState() => _QuickTimerState();
}

class _QuickTimerState extends State<QuickTimer> {
  // Stopwatch stopwatch = Stopwatch();

  final List<String> _tabs = ["Count Down", 'Stopwatch'];

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    var height = screenSize.height;
    var width = screenSize.width;
    Size size = screenSize.size;
    return DefaultTabController(
      length: _tabs.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton(
                icon: Icons.close,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Quick timer",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(),
            ],
          ),
          SizedBox(
            height: height * .03,
          ),
          TabBarMethod(tabTitle1: _tabs[0], tabTitle2: _tabs[1]),
          Expanded(
            child: TabBarView(children: [
              stopwatch(),
              Column(
                children: [
                  SizedBox(
                    height: height * .1,
                  ),
                  Container(
                    child: buildCupertinoTimerPicker(),
                    height: height * .40,
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  SizedBox(
                    height: height * .1,
                    child: Text(
                      "00 : 00 : 00",
                      style:
                      TextStyle(fontSize: 40, color: Color(0xff4E4D4B)),
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    children: [
                      Container(
                          width: width * .45,
                          decoration: BoxDecoration(
                              color: Color(0xFF35CF6A),
                              borderRadius: BorderRadius.circular(4)),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Start",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),

                            /* style: ButtonStyle(
                       backgroundColor: Colors.green
                     ),)*/
                          )),
                      Container(
                          width: width * .45,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(4)),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Stop",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),

                            /* style: ButtonStyle(
                       backgroundColor: Colors.green
                     ),)*/
                          )),
                    ],
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }

  bool startIsPressed = true;
  bool stopIsPressed = true;
  bool resetIsPressed = true;
  bool starstoptoggle = true;
  var stopwatch_ = Stopwatch();
  final duration = Duration(seconds: 1);

  String displaytime = "00:00:00";

  void startTimer() {
    Timer(duration, running);
  }

  void running() {
    if (stopwatch_.isRunning) {
      startTimer();
    }
    setState(() {
      displaytime = stopwatch_.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          (stopwatch_.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (stopwatch_.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    });
  }

  void startStopwatch() {
    setState(() {
      startIsPressed = false;
      stopIsPressed = false;
      resetIsPressed = false;
    });
    stopwatch_.start();
    startTimer();
  }

  void stopStopwatch() {
    setState(() {
      log("stopstopw called");
      stopIsPressed = true;
      startIsPressed = true;
    });
    stopwatch_.stop();
  }

  void resetStopwatch() {
    stopwatch_.reset();
    stopwatch_.stop();
    setState(() {
      startIsPressed = true;
      resetIsPressed = true;
      stopIsPressed = true;
    });
    displaytime = "00:00:00";
  }

  Widget stopwatch() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                displaytime,
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700),
              ),
            ),
            flex: 6,
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: stopIsPressed ? null:
                            () {
                          stopStopwatch();
                          log("press");
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red),
                        child: Text(
                          "Stop",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: resetIsPressed ? null : resetStopwatch,
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                        onSurface: Colors.black),
                        child: Text(
                          "Reset",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: startIsPressed ? startStopwatch : null,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green),
                    child: Text(
                      "Start",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            flex: 4,
          )
        ],
      ),
    );
  }
}
