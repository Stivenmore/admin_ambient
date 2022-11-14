import 'package:admin_ambient/domain/logic/general/general_cubit.dart';
import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/components/analytics_components.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/layouts/detailuser_screen.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/drawer_dashboard/drawer_dashboard.dart';
import 'package:admin_ambient/screen/home/layouts/notifications/layouts/notificacions_screen.dart';
import 'package:admin_ambient/screen/utils/global_functions/global_functions.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final screens = {0: const AnalyticsComponents(), 1: const DetailUserScreen()};
  final globalScreen = {
    0: const DashBoardScreen(),
    1: const NotificacionScreen()
  };

  @override
  Widget build(BuildContext context) {
    SignInAndUpCubit cubit = context.watch<SignInAndUpCubit>();
    GeneralCubit generalCubit = context.watch<GeneralCubit>();
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
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            key: ValueKey(generalCubit.state.currentPageDashboard),
            child: generalCubit.state.globalcurrentpage == 0
                ? screens[generalCubit.state.currentPageDashboard]!
                : globalScreen[generalCubit.state.globalcurrentpage],
          ),
        ),
      ),
    ]);
  }
}
