import 'package:flutter/material.dart';

class AnimatedDot extends StatelessWidget {
  final bool isSelected;
  final double dotSize;

  AnimatedDot({required this.isSelected, required this.dotSize});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: isSelected ? dotSize * 1.5 : dotSize,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        color: isSelected ? Color.fromARGB(255, 44, 46, 67) : Colors.grey,
      ),
    );
  }
}
