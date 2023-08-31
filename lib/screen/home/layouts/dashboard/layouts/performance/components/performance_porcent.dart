import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformancePorcent extends StatelessWidget {
  const PerformancePorcent({
    Key? key,
    required this.large,
    required this.subtitle,
  }) : super(key: key);

  final String large;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          large,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 20,
                  color: UniCodes.whiteperformance,
                  fontWeight: FontWeight.w700)),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          subtitle,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 10, color: UniCodes.gray2)),
        ),
      ],
    );
  }
}
