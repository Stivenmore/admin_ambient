import 'package:admin_ambient/domain/logic/notes/notes_cubit.dart';
import 'package:admin_ambient/domain/models/notes_model.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AllListNotes extends StatelessWidget {
  const AllListNotes({
    Key? key,
    required this.responsive,
    required this.list
  }) : super(key: key);

  final Responsive responsive;
  final List<NotesModel> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsive.height,
      width: 300,
      child: Builder(builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 20, bottom: 10),
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        color: UniCodes.gray2.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: UniCodes.blueperformance,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Agregar nota",
                            style: GoogleFonts.roboto(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 350,
                        decoration: BoxDecoration(
                            color: UniCodes.gray2.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                list[index].time,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    color: UniCodes.gray3.withOpacity(0.7)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 25,
                                width: 340,
                                child: Text(
                                  list[index].name,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      color: UniCodes.gray3.withOpacity(0.7)),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Cantidad de episodios: ${list[index].episodes.length}",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    color: UniCodes.gray3.withOpacity(0.7)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 20,
                                width: 340,
                                child: Text(
                                  list[index].description,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      color: UniCodes.gray3.withOpacity(0.7)),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Creador: ${list[index].creator}",
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    color: UniCodes.gray3.withOpacity(0.7)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          right: 5,
                          top: 5,
                          child: IconButton(
                              onPressed: () {
                                context
                                    .read<NotesCubit>()
                                    .deleteNotes(list[index].id);
                              },
                              icon: Icon(
                                Icons.close,
                                color: UniCodes.orangeperformance2,
                              )))
                    ],
                  ),
                );
              }, childCount: list.length),
            )
          ],
        );
      }),
    );
  }
}
