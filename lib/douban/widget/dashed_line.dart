import 'package:flutter/material.dart';



class YFDashedLine extends StatelessWidget {

  final Axis axis;//默认值水平排布的
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;

  YFDashedLine({
    this.axis = Axis.horizontal,
    this.dashedHeight = 1,
    this.dashedWidth = 1,
    this.count = 10,
    this.color = Colors.red

  });


  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) {
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}