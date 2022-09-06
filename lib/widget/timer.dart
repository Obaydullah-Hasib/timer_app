import 'package:flutter/material.dart';

import 'icon_button_custom.dart';
class TimerSegment extends StatelessWidget {

String? title, time, buttonName;

TimerSegment({required this.title,required this.time,required this.buttonName, required this.color});

  final Color color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width/200),
      child: Container(

        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${title}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${time}"),
                ),
              ],
            ),
            StartStopButton(buttonName: buttonName,color: color,)
          ],
        ),
      ),
    );
  }
}