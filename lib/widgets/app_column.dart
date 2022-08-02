import 'package:flutter/material.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text:text, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) {return const Icon(Icons.star, color: ConstantColor.mainColor, size: 15,);}),
            ),
            const SizedBox(width: 10,),
            SmallText(text: '4.5'),
            const SizedBox(width: 10,),
            SmallText(text: '1287'),
            const SizedBox(width: 10,),
            SmallText(text: 'comments')
          ],
        ),
        SizedBox(height: Dimensions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: ConstantColor.iconColor),
            IconAndTextWidget(icon: Icons.location_on,
                text: '1.7km',
                iconColor: ConstantColor.mainColor),
            IconAndTextWidget(icon: Icons.access_time_rounded ,
                text: '32min',
                iconColor: ConstantColor.appColor),
          ],
        ),
      ],
    );
  }
}
