import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {


  MyButton({
    Key? key, required this.icon, required this.onPressed
  }) : super(key: key);
  final IconData icon;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon),
    splashRadius: 15,);
  }
}

class StartStopButton extends StatelessWidget {
final  String? buttonName;
final Color color;

  const StartStopButton({
    Key? key,
  required String? this.buttonName, required Color this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextButton(onPressed: () {}, child: Text(buttonName!),

            style: ButtonStyle(

                foregroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(color: color),

                    )
                )


            ),
          ),
        ],
      ),
    );
  }
}
