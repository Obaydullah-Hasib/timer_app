import 'package:flutter/material.dart';

class OptionPageOption extends StatelessWidget {
  const OptionPageOption(
      {required this.icon, required this.onTap, required this.title});
  final IconData icon;
  final onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: ListTile(

          leading: Icon(icon,color: Colors.black,),
          title: Text(title,style: TextStyle(color: Theme.of(context).brightness == Brightness.light? Colors.redAccent: Colors.green)),
        ));
  }
}
