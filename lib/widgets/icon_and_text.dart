import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../dimensions.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.height(24),),
        const SizedBox(width: 5,),
        SmallText(text: text),
      ],
    );
  }
}
