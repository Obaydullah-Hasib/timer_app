import 'package:flutter/material.dart';

import 'icon_button_custom.dart';
class TimerSegment extends StatelessWidget {
  const TimerSegment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Workout timer"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("15:00"),
              ),
            ],
          ),
          StartStopButton(buttonName: "START",color: Colors.green,)
        ],
      ),
    );
  }
}