import 'package:admin_ambient/domain/logic/general/general_cubit.dart';
import 'package:admin_ambient/domain/logic/podcast/podcast_cubit.dart';
import 'package:admin_ambient/domain/services/prefs_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:admin_ambient/screen/utils/animation/fade_animattion.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:admin_ambient/domain/logic/analytics/analytics_cubit.dart';
import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerDashboard extends StatefulWidget {
  final SignInAndUpCubit cubit;
  const DrawerDashboard({super.key, required this.cubit});

  @override
  State<DrawerDashboard> createState() => _DrawerDashboardState();
}

class _DrawerDashboardState extends State<DrawerDashboard> {
  @override
  void initState() {
    context.read<AnalyticsCubit>()
      ..getAllLastUpdate()
      ..getAllUserRegisterDay()
      ..getAllUserRegisterMonth()
      ..getAllUserRegisterYears();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final generalcubit = context.read<GeneralCubit>();
    Responsive responsive = Responsive(context);
    return Builder(builder: (context) {
      final value2 = context.select<GeneralCubit, int>(
          (value2) => value2.state.globalcurrentpage);
      final statePodcast = context.select<PodcastCubit, PodCastEnum>(
          (value) => value.state.podCastEnum);
      return FadeAnimation(
        500,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: SizedBox(
            height: responsive.height - responsive.st(8),
            width: responsive.wp(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, top: 10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: UniCodes.orangeperformance2.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(13)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Dashboard\n  Ambient',
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                  width: 0,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(48),
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: CachedNetworkImage(
                              imageUrl: widget.cubit.usermodelCubit.img!
                                  .toString()
                                  .replaceAll('"', '')
                                  .trim(),
                              placeholder: (context, url) =>
                                  Image.asset('assets/no-image.jpg'),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fadeOutDuration: const Duration(seconds: 1),
                              fadeInDuration: const Duration(seconds: 2),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: -2,
                            right: -2,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                child: const Icon(
                                  CupertinoIcons.antenna_radiowaves_left_right,
                                  size: 14,
                                ),
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.cubit.usermodelCubit.nombre,
                      style: GoogleFonts.roboto(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (value2 != 0 &&
                                statePodcast != PodCastEnum.loading) {
                              generalcubit.changeGlobalCurrentPage(0);
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                "   | General ",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: value2 == 0
                                        ? UniCodes.orangeperformance2
                                        : UniCodes.gray2),
                                textAlign: TextAlign.left,
                              ),
                              Icon(Icons.home,
                                  color: value2 == 0
                                      ? UniCodes.orangeperformance2
                                      : UniCodes.gray2)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            if (value2 != 1 &&
                                statePodcast != PodCastEnum.loading) {
                              generalcubit.changeGlobalCurrentPage(1);
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                "   | Notificaciones ",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: value2 == 1
                                        ? UniCodes.orangeperformance2
                                        : UniCodes.gray2),
                                textAlign: TextAlign.left,
                              ),
                              Icon(Icons.notifications,
                                  color: value2 == 1
                                      ? UniCodes.orangeperformance2
                                      : UniCodes.gray2)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              if (value2 != 2 &&
                                  statePodcast != PodCastEnum.loading) {
                                generalcubit.changeGlobalCurrentPage(2);
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  "   | Podcast ",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: value2 == 2
                                          ? UniCodes.orangeperformance2
                                          : UniCodes.gray2),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(Icons.settings_voice_rounded,
                                    color: value2 == 2
                                        ? UniCodes.orangeperformance2
                                        : UniCodes.gray2)
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              if (value2 != 3 &&
                                  statePodcast != PodCastEnum.loading) {
                                generalcubit.changeGlobalCurrentPage(3);
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  "   | Notas ",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: value2 == 3
                                          ? UniCodes.orangeperformance2
                                          : UniCodes.gray2),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(Icons.notes,
                                    color: value2 == 3
                                        ? UniCodes.orangeperformance2
                                        : UniCodes.gray2)
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              UserPreferences().token = "";
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', ((route) => false));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "   | Salir ",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: UniCodes.cielperformance),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(Icons.exit_to_app,
                                    color: UniCodes.cielperformance)
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
