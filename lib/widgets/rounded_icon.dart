// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  final IconData iconName;
  final void Function() onPressed;

  RoundedIcon({required this.iconName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child:  Icon(iconName, color: Colors.black,),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(Color(0xffD4D4D4)), // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
        }),
      ),
    );
  }
}