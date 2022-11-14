import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/dashboard_screen.dart';
import 'package:admin_ambient/screen/splash/layouts/splash_screen.dart';
import 'package:admin_ambient/screen/utils/global_functions/global_functions.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SignInAndUpCubit cubit = context.watch<SignInAndUpCubit>();
    Responsive responsive = Responsive(context);
    return Scaffold(
      backgroundColor: UniCodes.blueblack,
      drawer: imageCalculateWidthHome(responsive) != DisplayType.web
          ? const Drawer()
          : Container(),
      body: Padding(
        padding: EdgeInsets.all(
            imageCalculateWidthHome(responsive) != DisplayType.web
                ? 5
                : responsive.st(8)),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(26)),
          child: !cubit.isloadingGetuser
              ? cubit.usermodelCubit.nombre.isNotEmpty
                  ? const DashBoardScreen()
                  : const SplashScreen()
              : Image.asset(
                  "assets/404.jpg",
                  height: responsive.hp(50),
                  width: responsive.wp(50),
                ),
        ),
      ),
    );
  }
}
