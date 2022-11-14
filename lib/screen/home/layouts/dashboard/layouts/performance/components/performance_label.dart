import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformanceLabel extends StatelessWidget {
  const PerformanceLabel(
      {Key? key,
      required this.text,
      required this.avaible,
      required this.backgrouudIcon,
      this.isDark = false})
      : super(key: key);

  final Color backgrouudIcon;
  final String text;
  final bool avaible;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: backgrouudIcon, borderRadius: BorderRadius.circular(56)),
          child: Center(
            child: Icon(
              avaible ? Icons.check : Icons.close,
              color: UniCodes.whiteperformance,
              size: 22,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 14,
                  color: !isDark
                      ? UniCodes.whiteperformance
                      : UniCodes.blueperformance)),
        )
      ],
    );
  }
}
