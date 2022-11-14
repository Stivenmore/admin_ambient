import 'package:admin_ambient/domain/logic/general/general_cubit.dart';
import 'package:admin_ambient/domain/logic/search/search_cubit.dart';
import 'package:admin_ambient/domain/logic/user/user_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/search/components/button_search.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller =
      TextEditingController(text: "stiven@gmail.com");
  final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: UniCodes.whiteperformance));
  @override
  Widget build(BuildContext context) {
    final user = context.read<UserCubit>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 200,
                height: 40,
                child: TextFormField(
                  controller: controller,
                  cursorColor: UniCodes.whiteperformance,
                  decoration: InputDecoration(
                      focusedBorder: borderStyle,
                      border: borderStyle,
                      enabledBorder: borderStyle,
                      disabledBorder: borderStyle,
                      label: Text(
                        "Buscar por correo",
                        style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(color: UniCodes.whiteperformance)),
                      )),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              if (widget.responsive.width > 835)
                InkWell(
                  onTap: () {
                    context
                        .read<SearchCubit>()
                        .getQueryUsersSearch(controller.text);
                  },
                  child: const ButtonSearch(
                    text: " Buscar ",
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          if (widget.responsive.width < 835)
            InkWell(
              onTap: () {
                context
                    .read<SearchCubit>()
                    .getQueryUsersSearch(controller.text);
              },
              child: const ButtonSearch(
                text: " Buscar ",
              ),
            ),
          if (widget.responsive.width > 835)
            const SizedBox(
              height: 10,
            ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case SearchLoaded:
                  List<UserModel> list = state.props[0] as List<UserModel>;
                  if (list.isNotEmpty) {
                    return SizedBox(
                      height: 260,
                      //width: 300,
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Container(
                                height: 90,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                list[index].nombre,
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: UniCodes
                                                            .whiteperformance)),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              child: Text(
                                                "Ultimo inicio: ${list[index].lastlogin}",
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: UniCodes
                                                            .whiteperformance)),
                                              ),
                                            )
                                          ],
                                        ),
                                        if (widget.responsive.width > 835)
                                          InkWell(
                                            onTap: () {
                                              user.currenlyUser(list[index]);
                                              context
                                                  .read<GeneralCubit>()
                                                  .changePageDashboard(1);
                                            },
                                            child: const ButtonSearch(
                                              text: " Ver ",
                                            ),
                                          ),
                                      ],
                                    ),
                                    if (widget.responsive.width < 835)
                                      InkWell(
                                        onTap: () {
                                          user.currenlyUser(list[index]);
                                          context
                                              .read<GeneralCubit>()
                                              .changePageDashboard(1);
                                        },
                                        child: const ButtonSearch(
                                          text: " Ver ",
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: Text(
                        'Usuario no encontrado',
                        style: GoogleFonts.roboto(
                            textStyle:
                                TextStyle(color: UniCodes.whiteperformance)),
                      ),
                    );
                  }
                default:
                  return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
