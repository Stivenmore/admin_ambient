import 'package:admin_ambient/domain/logic/notificartion/notificacion_cubit.dart';
import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class NotificacionScreen extends StatefulWidget {
  const NotificacionScreen({super.key});

  @override
  State<NotificacionScreen> createState() => _NotificacionScreenState();
}

class _NotificacionScreenState extends State<NotificacionScreen> {
  @override
  void initState() {
    context.read<NotificacionCubit>().getActivateUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    SignInAndUpCubit cubit = context.watch<SignInAndUpCubit>();
    final notificationCubit = context.read<NotificacionCubit>();
    return WillPopScope(onWillPop: () async {
      return false;
    }, child: BlocBuilder<NotificacionCubit, NotificacionState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case NotificacionLoaded:
            List<UserModel> list = state.props[0] as List<UserModel>;
            return SizedBox(
              height: responsive.height,
              width: responsive.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 600.0,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                        childAspectRatio: 2.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Row(
                            children: [
                              InfoCardNotifier(
                                  list: list[0], responsive: responsive),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Realizado",
                                      style: GoogleFonts.roboto()),
                                  InkWell(
                                    onTap: () {
                                      notificationCubit.setNotifierHomeUser(
                                          user: list[index],
                                          manager: cubit.usermodelCubit,
                                          reasen: "Realizado",
                                          listCurrent: list);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: UniCodes.orangeperformance2,
                                          borderRadius:
                                              BorderRadius.circular(56)),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: UniCodes.whiteperformance,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("No Realizado",
                                      style: GoogleFonts.roboto()),
                                  InkWell(
                                    onTap: () {
                                      notificationCubit.setNotifierHomeUser(
                                          user: list[index],
                                          manager: cubit.usermodelCubit,
                                          reasen: "No Realizado",
                                          listCurrent: list);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: UniCodes.cielperformance,
                                          borderRadius:
                                              BorderRadius.circular(56)),
                                      child: Center(
                                        child: Icon(
                                          Icons.close,
                                          color: UniCodes.whiteperformance,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                        childCount: list.length,
                      ),
                    )
                  ],
                ),
              ),
            );
          case NotificacionLoading:
            UserModel list = UserModel(
                nombre: "",
                points: [Point(time: "", point: 0, type: "")],
                address: "",
                email: "",
                phone: "",
                id: "",
                transaction: <Transaction>[],
                recycler: <RecyclerModel>[]);
            return SizedBox(
              height: responsive.height,
              width: responsive.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 600.0,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                        childAspectRatio: 2.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.grey.shade100,
                            child: Row(
                              children: [
                                InfoCardNotifier(
                                    list: list, responsive: responsive),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Realizado",
                                        style: GoogleFonts.roboto()),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: UniCodes.orangeperformance2,
                                          borderRadius:
                                              BorderRadius.circular(56)),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: UniCodes.whiteperformance,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    Text("No Realizado",
                                        style: GoogleFonts.roboto()),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: UniCodes.cielperformance,
                                          borderRadius:
                                              BorderRadius.circular(56)),
                                      child: Center(
                                        child: Icon(
                                          Icons.close,
                                          color: UniCodes.whiteperformance,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        childCount: 20,
                      ),
                    )
                  ],
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    ));
  }
}

class InfoCardNotifier extends StatelessWidget {
  const InfoCardNotifier({
    Key? key,
    required this.list,
    required this.responsive,
  }) : super(key: key);

  final UserModel list;
  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: UniCodes.cielperformance),
          child: Center(
            child: Text(list.lastlogin ?? "...",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(color: UniCodes.whiteperformance),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          list.nombre,
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
              list.points.last.point.toString(),
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
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              list.email,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                color: UniCodes.gray3,
                fontSize: 14,
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
              "Direccion:",
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                color: UniCodes.gray3,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              )),
            ),
            const SizedBox(
              width: 6,
            ),
            SizedBox(
              width: 150,
              child: Text(
                list.address,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  color: UniCodes.gray3,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "Tel:",
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                color: UniCodes.gray3,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              list.phone,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                color: UniCodes.gray3,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
            ),
          ],
        )
      ],
    );
  }
}
