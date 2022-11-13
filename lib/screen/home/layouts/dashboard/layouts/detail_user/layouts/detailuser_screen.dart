import 'package:admin_ambient/domain/logic/general/general_cubit.dart';
import 'package:admin_ambient/domain/logic/user/user_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/info_card.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/percent_card.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailUserScreen extends StatefulWidget {
  const DetailUserScreen({super.key});

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>();
    final usermodel = user.state.userModel;
    Responsive responsive = Responsive(context);
    return WillPopScope(
        onWillPop: () async {
          context.read<GeneralCubit>().changePageDashboard(0);
          return true;
        },
        child: SizedBox(
          height: responsive.height,
          width: responsive.width,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
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
                      ),
                      if (responsive.width < 865)
                        ListRecycler(
                          usermodel: usermodel,
                        )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (responsive.width > 865)
                    ListRecycler(
                      usermodel: usermodel,
                    )
                ],
              ),
            ),
          ),
        ));
  }
}

class ListRecycler extends StatefulWidget {
  final UserModel usermodel;
  const ListRecycler({super.key, required this.usermodel});

  @override
  State<ListRecycler> createState() => _ListRecyclerState();
}

class _ListRecyclerState extends State<ListRecycler> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Padding(
      padding: EdgeInsets.only(top: responsive.width > 865 ? 160 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Lista de reciclaje",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
              color: UniCodes.blueperformance,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            height: responsive.height,
            child: SingleChildScrollView(
              child: ExpansionPanelList(
                  animationDuration: const Duration(milliseconds: 500),
                  dividerColor: UniCodes.cielperformance,
                  elevation: 1,
                  expandedHeaderPadding: const EdgeInsets.all(20),
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      widget.usermodel.recycler[index].isExpanded = !isExpanded;
                    });
                  },
                  children: widget.usermodel.recycler
                      .map<ExpansionPanel>((RecyclerModel recyclerModel) {
                    return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(
                              recyclerModel.time,
                              style: GoogleFonts.roboto(),
                            ),
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              PercenCard(
                                label: "Plastico",
                                value: recyclerModel.plastico,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              PercenCard(
                                label: "Metal",
                                value: recyclerModel.metal,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              PercenCard(
                                label: "Papel",
                                value: recyclerModel.papel,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              PercenCard(
                                label: "Carton",
                                value: recyclerModel.carton,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              PercenCard(
                                label: "Vidrio",
                                value: recyclerModel.vidrio,
                              ),
                            ],
                          ),
                        ),
                        isExpanded: recyclerModel.isExpanded);
                  }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
