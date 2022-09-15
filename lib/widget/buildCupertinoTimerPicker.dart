import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buildCupertinoTimerPicker extends StatefulWidget {
  const buildCupertinoTimerPicker({Key? key}) : super(key: key);

  @override
  State<buildCupertinoTimerPicker> createState() =>
      _buildCupertinoTimerPickerState();
}

class _buildCupertinoTimerPickerState extends State<buildCupertinoTimerPicker> {
  Duration duration = Duration();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CupertinoTimerPicker(

            initialTimerDuration: duration,
            onTimerDurationChanged: (duration) {
              setState(() {
                this.duration = duration;
                log("${duration.inHours} : ${duration.inMinutes} : ${duration.inSeconds}");
              });
            },
            mode: CupertinoTimerPickerMode.hms,
          ),
    /*  Text("${duration.inHours} : ${duration.inMinutes%60} : ${duration.inSeconds%60}",style: TextStyle(
          fontSize: 40,
          color: Color(0xff4E4D4B)
      ),)*/
        ],
      ),
    );
  }
}
