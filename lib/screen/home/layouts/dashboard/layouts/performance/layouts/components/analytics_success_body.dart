import 'package:admin_ambient/domain/logic/analytics/analytics_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/performance/components/performance_label.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/performance/components/performance_porcent.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticSuccessBody extends StatelessWidget {
  const AnalyticSuccessBody({
    Key? key,
    required this.avaibleNote,
    required this.avaiblePodcast,
    required this.model,
  }) : super(key: key);

  final List<UserModel> model;
  final bool avaiblePodcast, avaibleNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rendimiento",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 20, color: UniCodes.whiteperformance)),
              ),
              IconButton(
                  onPressed: () =>
                      context.read<AnalyticsCubit>().getAllLastUpdate(),
                  icon: Icon(
                    Icons.replay_5_outlined,
                    color: UniCodes.whiteperformance,
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PerformancePorcent(
                  large: model.length.toString(),
                  subtitle:
                      "${model.length > 1 ? 'Usuarios' : 'Usuario'} por dia"),
              Text(
                "|",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 40,
                        color: UniCodes.gray3,
                        fontWeight: FontWeight.w100)),
              ),
              const PerformancePorcent(large: "Funcionando", subtitle: "Estado")
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          PerformanceLabel(
            backgrouudIcon: UniCodes.orangeperformance,
            avaible: avaiblePodcast,
            text: avaiblePodcast
                ? "Podcast activos y disponibles"
                : "Podcast inactivos en app",
          ),
          const SizedBox(
            height: 20,
          ),
          PerformanceLabel(
            backgrouudIcon: UniCodes.cielperformance,
            avaible: avaibleNote,
            text: avaibleNote
                ? "Notas activos y disponibles"
                : "Notas inactivos en app",
          )
        ],
      ),
    );
  }
}
