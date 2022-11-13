import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({ this.updateColor,this.onPress, this.cardChild});

  final Widget? cardChild;
  final void Function()? onPress;
  final Color?  updateColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: updateColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
