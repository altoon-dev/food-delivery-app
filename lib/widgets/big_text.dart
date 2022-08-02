import 'package:flutter/material.dart';
import 'package:food_delivery/dimensions.dart';


class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({Key? key,this.color = const Color(0xFF323d2b),
    this.size=0,
    required this.text,
    this.overFlow=TextOverflow.ellipsis}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?Dimensions.font20:size,
      ),
    ) ;
  }
}
