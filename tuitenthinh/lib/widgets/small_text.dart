import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double heigth;
  SmallText({Key? key, this.color = Colors.cyan,
    required this.text,
    this.size=12,
    this.heigth=1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'Roboto',
          color: color,
        fontSize: size,
        height: heigth,
      ),
    );
  }
}
