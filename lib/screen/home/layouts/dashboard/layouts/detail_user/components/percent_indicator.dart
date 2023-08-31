import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({
    required this.color,
    required this.percent,
    this.fromLeft = true,
    super.key,
  });

  final Color color;
  final double percent;
  final bool fromLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UniCodes.gray1,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 7,
      child: LayoutBuilder(builder: (context, constraints) {
        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 900),
          tween: Tween(begin: 0.0, end: percent),
          builder: (context, value, _) {
            return Align(
              alignment:
                  fromLeft ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: constraints.maxWidth * value,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: color)),
              ),
            );
          },
        );
      }),
    );
  }
}
