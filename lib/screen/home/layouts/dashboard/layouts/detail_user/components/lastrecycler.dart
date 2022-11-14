import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/percent_card.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LastRecycler extends StatelessWidget {
  const LastRecycler({
    Key? key,
    required this.usermodel,
  }) : super(key: key);

  final UserModel usermodel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ultimo recyclaje",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
            color: UniCodes.blueperformance,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
        const SizedBox(
          height: 15,
        ),
        PercenCard(
          label: "Plastico",
          value: usermodel.recycler.last.plastico,
        ),
        const SizedBox(
          height: 12,
        ),
        PercenCard(
          label: "Metal",
          value: usermodel.recycler.last.metal,
        ),
        const SizedBox(
          height: 12,
        ),
        PercenCard(
          label: "Papel",
          value: usermodel.recycler.last.papel,
        ),
        const SizedBox(
          height: 12,
        ),
        PercenCard(
          label: "Carton",
          value: usermodel.recycler.last.carton,
        ),
        const SizedBox(
          height: 12,
        ),
        PercenCard(
          label: "Vidrio",
          value: usermodel.recycler.last.vidrio,
        ),
      ],
    );
  }
}