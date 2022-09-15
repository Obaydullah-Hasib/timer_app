
import 'package:flutter/material.dart';
import 'package:timer_app_rashad_vai/utilis/utils.dart';
import 'package:timer_app_rashad_vai/widget/icon_button_custom.dart';

import '../widget/OptionPageOption.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({Key? key}) : super(key: key);

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {

  @override
  Widget build(BuildContext context) {

    ScreenSize screenSize = ScreenSize(context);
    var height = screenSize.height;
    var width = screenSize.width;
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton(icon: Icons.close, onPressed: () {Navigator.pop(context);}),
              SizedBox(),Text("Options",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              SizedBox(width: width*.25,),
            ],
          ),
          OptionPageOption(
              icon: Icons.notifications_outlined,
              onTap: () {},
              title: "Notifications"),
          SizedBox(height: height/30,),

          OptionPageOption(
              icon: Icons.phone,
              onTap: () {},
              title: "Write us review"),
          Divider(),
          OptionPageOption(
              icon: Icons.star_border_purple500_sharp,
              onTap: () {},
              title: "Rate us"),
          Divider(),
          OptionPageOption(
              icon: Icons.ios_share_outlined,
              onTap: () {},
              title: "Share app"),

        ],
      ),
    );
  }
}
