import 'package:admin_ambient/domain/logic/podcast/podcast_cubit.dart';
import 'package:admin_ambient/domain/models/podcast_model.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class CardPodCast extends StatelessWidget {
  const CardPodCast(
      {Key? key,
      required this.responsive,
      required this.list,
      required this.id,
      required this.alllist})
      : super(key: key);

  final Responsive responsive;
  final PodcastModel list;
  final List<PodcastModel> alllist;
  final String id;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Builder(builder: (context) {
      final state = context.select<PodcastCubit, PodLoadingDelete>(
          (value) => value.state.podLoadingDelete);
      if (state == PodLoadingDelete.loading) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: responsive.width < 615 ? 290 : 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: UniCodes.orangeperformance2),
              child: Padding(
                padding: EdgeInsets.all(
                  responsive.width < 615 ? 5 : 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/Splash.png",
                            image: list.img,
                            fit: BoxFit.cover,
                            height: responsive.width < 615 ? 80 : 130,
                            width: responsive.width < 615 ? 80 : 110,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PODCAST",
                              style: GoogleFonts.roboto(
                                  color: UniCodes.whiteperformance,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              list.name,
                              style: GoogleFonts.roboto(
                                  color: UniCodes.whiteperformance,
                                  fontWeight: FontWeight.w700,
                                  fontSize: responsive.width < 615 ? 12 : 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "De ${list.author}",
                              style: GoogleFonts.roboto(
                                  color: UniCodes.whiteperformance,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "De ${list.update}",
                              style: GoogleFonts.roboto(
                                  color: UniCodes.whiteperformance,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: UniCodes.orangeperformance2,
                              borderRadius: BorderRadius.circular(56)),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: UniCodes.orangeperformance2,
                              size: 22,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: UniCodes.whiteperformance,
                              borderRadius: BorderRadius.circular(56)),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: UniCodes.orangeperformance2,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: responsive.width < 615 ? 290 : 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: UniCodes.orangeperformance2),
            child: Padding(
              padding: EdgeInsets.all(
                responsive.width < 615 ? 5 : 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/Splash.png",
                          image: list.img,
                          fit: BoxFit.cover,
                          height: responsive.width < 615 ? 80 : 130,
                          width: responsive.width < 615 ? 80 : 110,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PODCAST",
                            style: GoogleFonts.roboto(
                                color: UniCodes.whiteperformance,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            list.name,
                            style: GoogleFonts.roboto(
                                color: UniCodes.whiteperformance,
                                fontWeight: FontWeight.w700,
                                fontSize: responsive.width < 615 ? 12 : 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "De ${list.author}",
                            style: GoogleFonts.roboto(
                                color: UniCodes.whiteperformance,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "De ${list.update}",
                            style: GoogleFonts.roboto(
                                color: UniCodes.whiteperformance,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                  responsive.width > 420
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                context
                                    .read<PodcastCubit>()
                                    .deletePodcast(id, alllist, list);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: UniCodes.whiteperformance,
                                    borderRadius: BorderRadius.circular(56)),
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    color: UniCodes.orangeperformance2,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
