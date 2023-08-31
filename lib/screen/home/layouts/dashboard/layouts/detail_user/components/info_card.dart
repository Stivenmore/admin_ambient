import 'package:admin_ambient/domain/logic/user/user_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.user,
    required this.usermodel,
  }) : super(key: key);

  final UserCubit user;
  final UserModel usermodel;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return SizedBox(
      width: 375,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/Splash.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(14)),
              ),
              const SizedBox(
                width: 10,
              ),
              if (responsive.width > 555)
                InfoCardDetailUser(
                  user: user,
                )
            ],
          ),
          if (responsive.width < 555)
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                InfoCardDetailUser(
                  user: user,
                ),
              ],
            )
        ],
      ),
    );
  }
}

class InfoCardDetailUser extends StatelessWidget {
  const InfoCardDetailUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserCubit user;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Builder(builder: (context) {
      final usermodel = context
          .select<UserCubit, UserModel>((value) => value.state.userModel);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 25,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: UniCodes.orangeperformance2),
            child: Center(
              child: Text(user.state.userModel.lastlogin ?? "",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: UniCodes.whiteperformance),
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.state.userModel.nombre,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
              color: UniCodes.blueperformance,
              fontSize: responsive.width > 350 ? 22 : 17,
              fontWeight: FontWeight.w700,
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Puntos actuales:",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  color: UniCodes.gray3,
                  fontSize: responsive.width > 350 ? 16 : 14,
                  fontWeight: FontWeight.w500,
                )),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                usermodel.points.isNotEmpty
                    ? usermodel.points.last.point.toString()
                    : "No disponible",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  color: UniCodes.gray3,
                  fontSize: responsive.width > 350 ? 16 : 14,
                  fontWeight: FontWeight.w500,
                )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Correo:",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  color: UniCodes.gray3,
                  fontSize: responsive.width > 350 ? 16 : 14,
                  fontWeight: FontWeight.w500,
                )),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                usermodel.email,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  color: UniCodes.gray3,
                  fontSize: responsive.width > 350 ? 16 : 14,
                  fontWeight: FontWeight.w500,
                )),
              ),
            ],
          )
        ],
      );
    });
  }
}
