import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonSearch extends StatelessWidget {
  final String? text;
  const ButtonSearch({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: UniCodes.blueperformance),
      child: Center(
        child: Text(
          text ?? " Buscar ",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(color: UniCodes.whiteperformance)),
        ),
      ),
    );
  }
}
