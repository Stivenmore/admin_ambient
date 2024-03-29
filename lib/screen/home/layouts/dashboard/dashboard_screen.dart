import 'package:admin_ambient/domain/logic/general/general_cubit.dart';
import 'package:admin_ambient/domain/logic/podcast/podcast_cubit.dart';
import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/domain/services/prefs_services.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/components/analytics_components.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/layouts/detailuser_screen.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/drawer_dashboard/drawer_dashboard.dart';
import 'package:admin_ambient/screen/home/layouts/notes/notes_screen.dart';
import 'package:admin_ambient/screen/home/layouts/notifications/layouts/notificacions_screen.dart';
import 'package:admin_ambient/screen/home/layouts/podcast/podcast_screen.dart';
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
    1: const NotificacionScreen(),
    2: const PodCastScreen(),
    3: const NoteScreen()
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
          height: imageCalculateWidthHome(responsive) != DisplayType.web
              ? responsive.height
              : responsive.height - responsive.st(8),
          width: imageCalculateWidthHome(responsive) == DisplayType.web
              ? responsive.wp(75)
              : responsive.width,
          decoration: BoxDecoration(
              color: UniCodes.ligthgrey,
              borderRadius: BorderRadius.circular(26)),
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              key: ValueKey(generalCubit.state.currentPageDashboard),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        imageCalculateWidthHome(responsive) != DisplayType.web
                            ? const EdgeInsets.all(30)
                            : const EdgeInsets.all(0),
                    child: generalCubit.state.globalcurrentpage == 0
                        ? screens[generalCubit.state.currentPageDashboard]!
                        : globalScreen[generalCubit.state.globalcurrentpage]!,
                  ),
                  if (imageCalculateWidthHome(responsive) != DisplayType.web)
                    Builder(builder: (context) {
                      final generalcubit = context.read<GeneralCubit>();
                      final value2 = context.select<GeneralCubit, int>(
                          (value2) => value2.state.globalcurrentpage);
                      final statePodcast =
                          context.select<PodcastCubit, PodCastEnum>(
                              (value) => value.state.podCastEnum);
                      return SizedBox(
                        height: 30,
                        width: responsive.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (value2 != 0 &&
                                      statePodcast != PodCastEnum.loading) {
                                    generalcubit.changeGlobalCurrentPage(0);
                                  }
                                },
                                icon: Icon(Icons.home,
                                    color: value2 == 0
                                        ? UniCodes.orangeperformance2
                                        : UniCodes.gray2)),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {
                                  if (value2 != 1 &&
                                      statePodcast != PodCastEnum.loading) {
                                    generalcubit.changeGlobalCurrentPage(1);
                                  }
                                },
                                icon: Icon(Icons.notifications,
                                    color: value2 == 1
                                        ? UniCodes.orangeperformance2
                                        : UniCodes.gray2)),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {
                                  if (value2 != 2 &&
                                      statePodcast != PodCastEnum.loading) {
                                    generalcubit.changeGlobalCurrentPage(2);
                                  }
                                },
                                icon: Icon(Icons.settings_voice_rounded,
                                    color: value2 == 2
                                        ? UniCodes.orangeperformance2
                                        : UniCodes.gray2)),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {
                                  if (value2 != 3 &&
                                      statePodcast != PodCastEnum.loading) {
                                    generalcubit.changeGlobalCurrentPage(3);
                                  }
                                },
                                icon: Icon(Icons.notes,
                                    color: value2 == 3
                                        ? UniCodes.orangeperformance2
                                        : UniCodes.gray2)),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {
                                  UserPreferences().token = "";
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/', ((route) => false));
                                },
                                icon: Icon(Icons.exit_to_app,
                                    color: UniCodes.cielperformance)),
                          ],
                        ),
                      );
                    }),
                ],
              )),
        ),
      ),
    ]);
  }
}
