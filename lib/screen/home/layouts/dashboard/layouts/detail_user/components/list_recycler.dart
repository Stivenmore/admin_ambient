import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/percent_card.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: EdgeInsets.only(top: responsive.width > 865 ? 190 : 20),
      child: SingleChildScrollView(
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
              width: responsive.width > 500 ? 300 : 250,
              height: responsive.height,
              child: SingleChildScrollView(
                child: ExpansionPanelList(
                    animationDuration: const Duration(milliseconds: 500),
                    dividerColor: UniCodes.cielperformance,
                    elevation: 1,
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        widget.usermodel.recycler[index].isExpanded =
                            !isExpanded;
                      });
                    },
                    children: widget.usermodel.recycler
                        .map<ExpansionPanel>((RecyclerModel recyclerModel) {
                      return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(
                                recyclerModel.time,
                                style: GoogleFonts.roboto(),
                              ),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 200,
                              width: 250,
                              child: ListView(
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
                          ),
                          isExpanded: recyclerModel.isExpanded);
                    }).toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
