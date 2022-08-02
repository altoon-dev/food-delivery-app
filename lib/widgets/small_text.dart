import 'package:flutter/material.dart';


class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText({Key? key,this.color = const Color(0xFFccc7c5),
    this.size=12,
    required this.text,
    this.height=1.2
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    ) ;
  }
}

