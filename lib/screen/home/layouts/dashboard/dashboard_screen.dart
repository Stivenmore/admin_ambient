import 'package:admin_ambient/domain/logic/analytics/analytics_cubit.dart';
import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/drawer_dashboard/drawer_dashboard.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/engagement/components/engagement_card.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/engagement/layouts/engagement_screen.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/performance/layouts/performace_dashboard.dart';
import 'package:admin_ambient/screen/utils/global_functions/global_functions.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    SignInAndUpCubit cubit = context.watch<SignInAndUpCubit>();
    AnalyticsCubit analyticsCubit = context.watch<AnalyticsCubit>();
    Responsive responsive = Responsive(context);
    return Stack(alignment: Alignment.centerRight, children: [
      Positioned(
        top: 0,
        left: 0,
        child: imageCalculateWidthHome(responsive) == DisplayType.web
            ? DrawerDashboard(
                cubit: cubit,
              )
            : const SizedBox(
                height: 0,
                width: 0,
              ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Container(
          height: responsive.height - responsive.st(8),
          width: imageCalculateWidthHome(responsive) == DisplayType.web
              ? responsive.wp(75)
              : responsive.width,
          decoration: BoxDecoration(
              color: UniCodes.ligthgrey,
              borderRadius: BorderRadius.circular(26)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment:
                      imageCalculateWidthHome(responsive) == DisplayType.mobile
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                  children: [
                    Performance(
                      update: analyticsCubit.state.enumUpdate,
                      model: analyticsCubit.state.analyticsUpdateUser,
                      avaibleNote: analyticsCubit.state.avaibleNotes,
                      avaiblePodcast: analyticsCubit.state.avaiblePodcast,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const EngagementScreen()
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

