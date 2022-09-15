import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_app_rashad_vai/pages/createNewTimer.dart';
import 'package:timer_app_rashad_vai/pages/optionPage.dart';
import 'package:timer_app_rashad_vai/utilis/utils.dart';
import 'package:timer_app_rashad_vai/widget/TabBarMethod.dart';
import 'package:timer_app_rashad_vai/widget/timerSegment.dart';

import '../widget/icon_button_custom.dart';
import 'QuickTimer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isSelected = [true, false];
  int selected = 0;
  final List<String> _tabs = ["All Timers", 'Active Timers'];

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);
    var height = screenSize.height;
    var width = screenSize.width;
    Size size = screenSize.size;
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                elevation: 1.5,

                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                ),

                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                      height: height*.90,
                      child: CreateNewTimer());
                });
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.grey.shade300,
          splashColor: Colors.black,
          shape: StadiumBorder(
              side: BorderSide(
            color: Colors.grey.shade500,
          )),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                MyButton(
                  icon: Icons.menu,
                  onPressed: ()=>showModalBottomSheet(context: context,
                    builder: (context)=>Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: height * 0.90,

                          child: OptionPage()),
                    ),isScrollControlled: true

                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Timer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                Row(
                  children: [
                    MyButton(
                        icon: Icons.timer,
                        onPressed: () => showModalBottomSheet(
                            isScrollControlled: true,
                            elevation: 1,
                            backgroundColor: Color(0xFFFAFAFA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            context: context,
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                  height: height * 0.93,

                                  child: QuickTimer()),
                            ))),
                  ],
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            const SizedBox(
              height: 20,
            ),
            TabBarMethod(
                tabTitle1: _tabs[0],
                tabTitle2: _tabs[1]),
            Expanded(
                child: TabBarView(
              children: [
                ListView(
                  children: [
                    TimerSegment(
                        title: "Workout Timer",
                        time: "15:00",
                        buttonName: "Start",
                        color: Colors.green),
                    buildSizedBox(height),
                    TimerSegment(
                        title: "Workout Timer",
                        time: "15:00",
                        buttonName: "Start",
                        color: Colors.green),
                    buildSizedBox(height),
                    TimerSegment(
                        title: "Workout Timer",
                        time: "15:00",
                        buttonName: "Start",
                        color: Colors.green),
                    buildSizedBox(height),
                    TimerSegment(
                        title: "Workout Timer",
                        time: "15:00",
                        buttonName: "Start",
                        color: Colors.green),
                    buildSizedBox(height),
                    TimerSegment(
                        title: "Sex Timer",
                        time: "15:00",
                        buttonName: "Start",
                        color: Colors.green),
                  ],
                ),
                ListView(
                  children: [
                    TimerSegment(
                        title: "Workout timer",
                        time: "13:15",
                        buttonName: "Stop",
                        color: Colors.red)
                  ],
                )
              ],
            ))
          ],
        )),
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height / 150,
    );
  }
}
