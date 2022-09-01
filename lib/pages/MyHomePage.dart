import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/icon_button_custom.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isSelected = [true, false];
  int selected=0;
  List<String> _tabs = ["All Timers",'Active Timers'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Text(widget.title),
        //   centerTitle: true,
        //   leading: GestureDetector(
        //     onTap: (){
        //     },
        //     child: Icon(Icons.),
        //   ),
        //
        // ),

        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  MyButton(icon: Icons.keyboard_option_key),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Timer"),
                  ),
                  Row(
                    children: [
                      MyButton(icon: Icons.bolt),
                      MyButton(icon: Icons.add)
                    ],
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              // Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         border: Border.all(
              //             color: Colors.black,
              //             width: 1,
              //             style: BorderStyle.solid)),
              //
              //     //  padding: EdgeInsets.fromLTRB(size.width/4, 10, size.width/4, 10),
              //     width: size.width / 2,
              //     height: size.height / 25,
              //     child: ToggleButtons(
              //       fillColor: selected==0? Colors.blue.shade400:,
              //       children: [
              //
              //        Text("All Timers",style: TextStyle(
              //         color:Colors.black
              //       ),), Text("Active Timers")],
              //       isSelected: isSelected,
              //       onPressed: (int newIndex) {
              //         setState(() {
              //           selected = newIndex;
              //         });
              //       },
              //     )
              //     //Row(
              //     //   children: [
              //     //     GestureDetector(
              //     //       onTap: (){
              //     //         print("ALL click");
              //     //       },
              //     //       child: Text("All Timers"),
              //     //     ),
              //     //     GestureDetector(
              //     //       onTap: (){print("Ac click");},
              //     //       child: Text("Active Timers"),
              //     //     ),
              //     //
              //     //
              //     //   ],
              //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     // ),
              //     ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  //padding: EdgeInsets.fromLTRB(size.width/4, 10, size.width/4, 10),
                  width: size.width / 2,
                  height: size.height / 25,
                  child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.lightBlue.shade400,
                        borderRadius: BorderRadius.circular(8),

                      ),
                      tabs: [Tab(
                    text: "Active Timers",
                  ),
                  Tab(
                    text: 'All Timers',
                  )]),
                ),
              ),
             SizedBox(
               height: 300,
               child: TabBarView(
                 children: [
                   Container(
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
                   ),
                   Container(
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
                         StartStopButton(buttonName: "STOP",color: Colors.red,)
                       ],
                     ),
                   ),
                 ],
               ),
             )
            ],
          ),
        )),
      ),
    );
  }
}


