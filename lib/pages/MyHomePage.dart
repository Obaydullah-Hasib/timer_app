import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timer_app_rashad_vai/widget/timer.dart';

import '../widget/icon_button_custom.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<bool> isSelected = [true, false];
  int selected=0;
  List<String> _tabs = ["All Timers",'Active Timers'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Container(color:Colors.tealAccent)),

              ListTile(
                title: Text("adsf"),

              ),
              Divider(thickness: 2,),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.add),
          backgroundColor: Colors.grey.shade300,
          splashColor: Colors.black,

          shape: StadiumBorder(
            side: BorderSide(
              color: Colors.grey.shade500,
            )
          ),
        ),


        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  MyButton(icon: Icons.menu,onPressed: (){ _scaffoldKey.currentState?.openDrawer();},),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Timer"),
                  ),
                  Row(
                    children: [
                      MyButton(icon: Icons.bolt,onPressed: (){print("bolt");}),
                      MyButton(icon: Icons.add,onPressed: (){print("add");})
                    ],
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),

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
             Expanded(child: TabBarView(

               children: [
                 ListView(
                   children: [ TimerSegment(title: "Workout Timer", time: "15:00", buttonName: "Start", color: Colors.green),
                     SizedBox(height: size.height/150,),
                     TimerSegment(title: "Sex Timer", time: "15:00", buttonName: "Start", color: Colors.green),],
                 ),
                 ListView(
                   children: [
                     TimerSegment(title: "Workout timer", time: "13:15", buttonName: "Stop", color: Colors.red)
                   ],
                 )

               ],
             ))
            ],
          ),
        )),
      ),
    );
  }
}


