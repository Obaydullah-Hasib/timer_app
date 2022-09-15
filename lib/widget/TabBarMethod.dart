import 'package:flutter/material.dart';

import '../utilis/utils.dart';
class TabBarMethod extends StatelessWidget {

  const TabBarMethod({
    Key? key,
    required this.tabTitle1,
    required this.tabTitle2
  }) : super(key: key);


  final String tabTitle1;
  final String tabTitle2;

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = ScreenSize(context);

    Size size = screenSize.size;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(

        decoration: BoxDecoration(

            color: Color(0xFFF0EFED),
            border: Border.all(color:Colors.grey.shade400,
            width: 2),
            borderRadius: BorderRadius.circular(10)
        ),
        //padding: EdgeInsets.fromLTRB(size.width/4, 10, size.width/4, 10),
        height: size.height / 25,
        width: size.width/1.5,
        child: TabBar(
            indicator: BoxDecoration(
              color: Color(0xFF5DB1D2),
              borderRadius: BorderRadius.circular(8),

            ),
            tabs:  [Tab(
              text: tabTitle1,
            ),
              Tab(
                text: tabTitle2,
              )]),
      ),
    );
  }
}