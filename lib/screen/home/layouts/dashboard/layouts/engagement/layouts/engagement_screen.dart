import 'package:admin_ambient/domain/logic/analytics/analytics_cubit.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/engagement/components/engagement_card.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class EngagementScreen extends StatefulWidget {
  const EngagementScreen({super.key});

  @override
  State<EngagementScreen> createState() => _EngagementScreenState();
}

class _EngagementScreenState extends State<EngagementScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<AnalyticsCubit>().getAllUserRegisterDay();
      context.read<AnalyticsCubit>().getAllUserRegisterMonth();
      context.read<AnalyticsCubit>().getAllUserRegisterYears();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AnalyticsCubit analyticsCubit = context.watch<AnalyticsCubit>();
    Responsive responsive = Responsive(context);
    return Container(
      height: 200,
      width: responsive.width,
      decoration: BoxDecoration(
          color: UniCodes.coffee2, borderRadius: BorderRadius.circular(26)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Compromiso",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    "Estadisticas generales de registro de usuarios",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            getContainerDay(analyticsCubit),
            const SizedBox(
              width: 30,
            ),
            getContainerMonth(analyticsCubit),
            const SizedBox(
              width: 30,
            ),
            getContainerYear(analyticsCubit),
          ],
        ),
      ),
    );
  }

  getContainerDay(AnalyticsCubit analyticsCubit) {
    if (analyticsCubit.state.enumDay == AnalyticsStateEnumDay.success) {
      return EngagementCard(
        label: analyticsCubit.state.analyticsDayUser.length.toString(),
        icon: Icons.remove_red_eye_sharp,
        type: " Este Dia",
      );
    } else if (analyticsCubit.state.enumDay == AnalyticsStateEnumDay.loading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade100,
        child: const EngagementCard(
          label: "",
          icon: Icons.remove_red_eye_sharp,
          type: "",
        ),
      );
    } else {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
  }

  getContainerMonth(AnalyticsCubit analyticsCubit) {
    if (analyticsCubit.state.enumMonth == AnalyticsStateEnumMonth.success) {
      return EngagementCard(
        label: analyticsCubit.state.analyticsMonthUser.length.toString(),
        icon: Icons.remove_red_eye_sharp,
        type: " Este Mes",
      );
    } else if (analyticsCubit.state.enumMonth ==
        AnalyticsStateEnumMonth.loading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade100,
        child: const EngagementCard(
          label: "",
          icon: Icons.remove_red_eye_sharp,
          type: "",
        ),
      );
    } else {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
  }

  getContainerYear(AnalyticsCubit analyticsCubit) {
    if (analyticsCubit.state.enumYears == AnalyticsStateEnumYears.success) {
      return EngagementCard(
        label: analyticsCubit.state.analyticsYearsUser.length.toString(),
        icon: Icons.remove_red_eye_sharp,
        type: " Este Año",
      );
    } else if (analyticsCubit.state.enumYears ==
        AnalyticsStateEnumYears.loading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade100,
        child: const EngagementCard(
          label: "",
          icon: Icons.remove_red_eye_sharp,
          type: "",
        ),
      );
    } else {
      return const SizedBox(
        height: 0,
        width: 0,
      );
    }
  }
}
