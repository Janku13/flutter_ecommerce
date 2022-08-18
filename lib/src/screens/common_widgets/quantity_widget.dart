import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
  const QuantityWidget({
    Key? key,
    required this.value,
    required this.suffixText,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(children: [
        _QuantityButton(
          onPressed: () {
            if (value == 1) return;
            int resulCount = value - 1;
            result(resulCount);
          },
          color: Colors.grey,
          icon: const Icon(
            Icons.remove,
            color: Colors.white,
            size: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            '$value$suffixText',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _QuantityButton(
          onPressed: () {
            int resulCount = value + 1;
            result(resulCount);
          },
          color: CustomColors.customSwatchColor,
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 16,
          ),
        ),
      ]),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final VoidCallback onPressed;
  const _QuantityButton({
    required this.icon,
    required this.color,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
      ),
    );
  }
}
