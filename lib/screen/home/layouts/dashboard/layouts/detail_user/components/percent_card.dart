import 'package:admin_ambient/domain/logic/user/user_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/percent_indicator.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PercenCard extends StatelessWidget {
  const PercenCard({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
              color: UniCodes.blueperformance,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            )),
          ),
        ),
        SizedBox(
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 100,
                child: PercentIndicator(
                  color: value / 10 == 1 || value > 10
                      ? UniCodes.orangeperformance2
                      : UniCodes.cielperformance,
                  percent: value > 10 ? 10 : value / 10,
                  fromLeft: false,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                " $value Kl",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  color: UniCodes.gray3,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ],
          ),
        )
      ],
    );
  }
}

