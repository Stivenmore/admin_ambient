import 'package:admin_ambient/domain/logic/notificartion/notificacion_cubit.dart';
import 'package:admin_ambient/domain/logic/podcast/podcast_cubit.dart';
import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/domain/models/podcast_model.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/podcast/components/cardpodcast.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class PodCastScreen extends StatefulWidget {
  const PodCastScreen({super.key});

  @override
  State<PodCastScreen> createState() => _PodCastScreenState();
}

class _PodCastScreenState extends State<PodCastScreen> {
  @override
  void initState() {
    context.read<PodcastCubit>().getAllPodcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SizedBox(
          height: responsive.height,
          width: responsive.width,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: responsive.width,
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${DateTime.now().hour}:${DateTime.now().minute}",
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              DateFormat("EEE, MMM d yyyy")
                                  .format(DateTime.now()),
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              color: UniCodes.orangeperformance2,
                              size: 26,
                            ))
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Text(
                      "PODCAST ACTUALES",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: UniCodes.orangeperformance2,
                              fontSize: 24,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: responsive.width < 1300
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    mainAxisAlignment: responsive.width < 1300
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      if (responsive.width < 1300)
                        SizedBox(
                          height: 400,
                          width: responsive.width < 615 ? 300 : 400,
                          child: const UploadPodCastCard(),
                        ),
                      Row(
                        crossAxisAlignment: responsive.width < 1300
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        mainAxisAlignment: responsive.width < 1300
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        children: [
                          Builder(builder: (context) {
                            final list = context
                                .select<PodcastCubit, List<PodcastModel>>(
                                    (value) => value.state.podcastList);
                            final enumm =
                                context.select<PodcastCubit, PodLoadingCast>(
                                    (value) => value.state.podLoadingCast);
                            switch (enumm) {
                              case PodLoadingCast.success:
                                return list.isNotEmpty
                                    ? SizedBox(
                                        height: 800,
                                        width: responsive.width < 615
                                            ? responsive.width < 400
                                                ? 290
                                                : 320
                                            : 500,
                                        child: ListView.builder(
                                          itemCount: list.length,
                                          itemBuilder: (context, index) {
                                            return CardPodCast(
                                                alllist: list,
                                                id: list[index].id ??
                                                    DateTime.now()
                                                        .microsecondsSinceEpoch
                                                        .toString(),
                                                responsive: responsive,
                                                list: list[index]);
                                          },
                                        ))
                                    : SizedBox(
                                        height: 300,
                                        width:
                                            responsive.width < 615 ? 250 : 500,
                                        child: Center(
                                          child: Text("Sin podcasts",
                                              style: GoogleFonts.roboto()),
                                        ),
                                      );
                              case PodLoadingCast.error:
                                return Container();
                              case PodLoadingCast.loading:
                                return SizedBox(
                                    height: 800,
                                    width: 500,
                                    child: ListView.builder(
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return CardPodCast(
                                          alllist: const <PodcastModel>[],
                                          responsive: responsive,
                                          id: "",
                                          list: PodcastModel(
                                              author: "",
                                              description: "",
                                              name: "",
                                              update: "",
                                              podcast: "",
                                              type: "",
                                              img:
                                                  "https://firebasestorage.googleapis.com/v0/b/ambient-ec3df.appspot.com/o/Img%2Fno-image.jpg?alt=media&token=cc289889-ea88-48a7-86ce-00e0ac3ce197"),
                                        );
                                      },
                                    ));
                              case PodLoadingCast.none:
                                return Container();

                              default:
                                return Container();
                            }
                          }),
                          const SizedBox(
                            width: 20,
                          ),
                          if (responsive.width > 1300)
                            SizedBox(
                              height: 400,
                              width: responsive.width < 615 ? 300 : 400,
                              child: const UploadPodCastCard(),
                            )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class UploadPodCastCard extends StatefulWidget {
  const UploadPodCastCard({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadPodCastCard> createState() => _UploadPodCastCardState();
}

class _UploadPodCastCardState extends State<UploadPodCastCard> {
  TextEditingController name = TextEditingController();
  final RoundedLoadingButtonController controller =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    UserModel userModel = context.read<SignInAndUpCubit>().usermodelCubit;
    Responsive responsive = Responsive(context);
    return Builder(builder: (context) {
      final state = context.select<PodcastCubit, PodCastEnum>(
          (value) => value.state.podCastEnum);
      switch (state) {
        case PodCastEnum.loading:
          controller.start();
          break;
        case PodCastEnum.success:
          controller.success();
          Future.delayed(const Duration(seconds: 2), () {
            controller.reset();
          });
          break;
        case PodCastEnum.error:
          controller.error();
          break;
        default:
      }
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(builder: (context) {
                      final state = context.select<PodcastCubit, PodCastImg>(
                          (value) => value.state.isSuccessImage);
                      return InkWell(
                        onTap: state != PodCastImg.success
                            ? () {
                                context.read<PodcastCubit>().getImageGallery();
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: state == PodCastImg.success
                                  ? UniCodes.orangeperformance2
                                  : UniCodes.gray2.withOpacity(0.5)),
                          height: responsive.width < 615 ? 70 : 150,
                          width: responsive.width < 615 ? 70 : 150,
                          child: state == PodCastImg.loading
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: UniCodes.whiteperformance,
                                    backgroundColor:
                                        UniCodes.orangeperformance2,
                                  ),
                                )
                              : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      state == PodCastImg.success
                                          ? "Imagen Cargada"
                                          : "Cargar Imagen",
                                      style: GoogleFonts.roboto(
                                          fontSize:
                                              responsive.width < 615 ? 12 : 18,
                                          color: UniCodes.whiteperformance),
                                    ),
                                  ),
                                ),
                        ),
                      );
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    Builder(builder: (context) {
                      final state = context.select<PodcastCubit, PodCastAudio>(
                          (value) => value.state.isSuccessAudio);
                      return InkWell(
                        onTap: state != PodCastImg.success
                            ? () {
                                context.read<PodcastCubit>().getAudioGallery();
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: state == PodCastAudio.success
                                  ? UniCodes.orangeperformance2
                                  : UniCodes.gray2.withOpacity(0.5)),
                          height: responsive.width < 615 ? 70 : 150,
                          width: responsive.width < 615 ? 70 : 150,
                          child: state == PodCastAudio.loading
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: UniCodes.whiteperformance,
                                    backgroundColor:
                                        UniCodes.orangeperformance2,
                                  ),
                                )
                              : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      state == PodCastAudio.success
                                          ? "Podcast Cargada"
                                          : "Cargar Podcast",
                                      style: GoogleFonts.roboto(
                                          fontSize:
                                              responsive.width < 615 ? 12 : 18,
                                          color: UniCodes.whiteperformance),
                                    ),
                                  ),
                                ),
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 170,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: name,
                    scrollPadding: const EdgeInsets.all(0.0),
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: UniCodes.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w800)),
                    cursorColor: UniCodes.green,
                    decoration: InputDecoration(
                      hintText: "Nombre del podcast",
                      errorMaxLines: 2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: UniCodes.orangeperformance2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: UniCodes.orangeperformance2),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: UniCodes.orangeperformance2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: UniCodes.orangeperformance2),
                      ),
                      focusColor: UniCodes.green,
                      fillColor: UniCodes.green,
                    ),
                    validator: (String? value) =>
                        value!.isEmpty ? 'Nombre del podcast' : null,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedLoadingButton(
                  width: 140,
                  color: UniCodes.orangeperformance,
                  controller: controller,
                  successColor: UniCodes.orangeperformance,
                  onPressed: () async {
                    if (name.text.isNotEmpty) {
                      context
                          .read<PodcastCubit>()
                          .setPodcast(name.text, userModel.nombre);
                      name.clear();
                      name.text = "";
                    } else {
                      controller.reset();
                    }
                  },
                  child: Text(
                    'Agregar',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: responsive.width < 615 ? 12 : 18,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
