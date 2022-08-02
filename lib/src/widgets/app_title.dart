import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/config/custom_colors.dart';

class AppTitle extends StatelessWidget {
  final Color? greenTitleColor;
  final double titleSize;
  const AppTitle({
    Key? key,
    this.greenTitleColor,
    this.titleSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: titleSize,
        ),
        children: [
          TextSpan(
            text: 'Groo',
            style: TextStyle(
              color: greenTitleColor ?? CustomColors.customSwatchColor,
            ),
          ),
          TextSpan(
            text: 'cers',
            style: TextStyle(
              color: CustomColors.customContrastColor,
            ),
          ),
        ],
      ),
    );
  }
}
