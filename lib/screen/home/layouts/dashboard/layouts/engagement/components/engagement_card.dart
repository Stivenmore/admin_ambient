import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EngagementCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final String type;
  const EngagementCard({
    required this.label,
    required this.icon,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: UniCodes.whiteperformance),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 150,
                  height: 25,
                  child: Text(
                    "  $label",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 25,
            left: 20,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: UniCodes.orangeperformance),
              child: Center(
                child: Icon(
                  icon,
                  color: UniCodes.whiteperformance,
                  size: 16,
                ),
              ),
            ))
      ],
    );
  }
}
