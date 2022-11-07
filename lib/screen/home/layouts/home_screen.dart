import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    UserModel cubit = context.watch<SignInAndUpCubit>().usermodelCubit;
    Responsive responsive = Responsive(context);
    return Scaffold(
      backgroundColor: UniCodes.blueblack,
      body: Padding(
        padding: EdgeInsets.all(responsive.st(8)),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(26)),
          child: Stack(alignment: Alignment.centerRight, children: [
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: responsive.height - responsive.st(8),
                  width: responsive.wp(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                color: UniCodes.coffee,
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
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(48),
                            child: SizedBox(
                              height: 70,
                              width: 70,
                              child: CachedNetworkImage(
                                imageUrl: cubit.img!
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
                            bottom: - 2,
                            right: - 2,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child:  Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                child: const Icon(CupertinoIcons
                                      .antenna_radiowaves_left_right, size: 14,),
                              ),
                            )
                          )
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: CachedNetworkImage(
                            imageUrl: cubit.img!
                                .toString()
                                .replaceAll('"', '')
                                .trim(),
                            placeholder: (context, url) =>
                                Image.asset('assets/no-image.jpg'),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fadeOutDuration: const Duration(seconds: 1),
                            fadeInDuration: const Duration(seconds: 2),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: CachedNetworkImage(
                            imageUrl: cubit.img!
                                .toString()
                                .replaceAll('"', '')
                                .trim(),
                            placeholder: (context, url) =>
                                Image.asset('assets/no-image.jpg'),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fadeOutDuration: const Duration(seconds: 1),
                            fadeInDuration: const Duration(seconds: 2),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Container(
                height: responsive.height - responsive.st(8),
                width: responsive.wp(75),
                decoration: BoxDecoration(
                    color: UniCodes.ligthgrey,
                    borderRadius: BorderRadius.circular(26)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
