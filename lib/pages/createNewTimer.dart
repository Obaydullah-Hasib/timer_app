import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_app_rashad_vai/widget/icon_button_custom.dart';

import '../utilis/utils.dart';
import '../widget/buildCupertinoTimerPicker.dart';

class CreateNewTimer extends StatefulWidget {
  const CreateNewTimer({Key? key}) : super(key: key);

  @override
  State<CreateNewTimer> createState() => _CreateNewTimerState();
}

class _CreateNewTimerState extends State<CreateNewTimer> {

  TextEditingController _textController = TextEditingController();
  bool _validate = true;
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height = ScreenSize(context).height;
    final width = ScreenSize(context).width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.05,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButton(
                  icon: Icons.close,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Text(
                "New Timer",
                style: TextStyle(fontSize: 18),
              ),
              MyButton(icon: Icons.check, onPressed: () {
                log("Title: "+_textController.text);
                setState(() {
                  _textController.text.isNotEmpty? _validate=true: _validate=false;
                  _textController.text.isNotEmpty?Navigator.pop(context):null;
                });
              }),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.05 ,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.10),
          child: TextFormField(
            controller: _textController,
            keyboardType: TextInputType.name,
            maxLength: 255,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: "Title",
              labelStyle: TextStyle(color: Color(0xFFD3CBC5)),
              hintText: "Title",
              errorText: _validate ? null: "Title can't be empty",
              fillColor: Color(0xff908D88),

              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff908D88), width: 2)),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        SizedBox(
          height: height * 0.40,
          child: buildCupertinoTimerPicker(),
        ),
        SizedBox(
          height: height * .10,
        ),
      ],
    );
  }


}
