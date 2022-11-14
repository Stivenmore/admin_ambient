import 'package:admin_ambient/domain/logic/general/general_cubit.dart';
import 'package:admin_ambient/domain/logic/user/user_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/calculatepoint.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/formaddrecycler.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/info_card.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/lastrecycler.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/list_recycler.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/detail_user/components/percent_card.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/performance/components/performance_label.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailUserScreen extends StatefulWidget {
  const DetailUserScreen({super.key});

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {
  TextEditingController controllerPlastico = TextEditingController();
  TextEditingController controllerMetal = TextEditingController();
  TextEditingController controllerPapel = TextEditingController();
  TextEditingController controllerCarton = TextEditingController();
  TextEditingController controllerVidrio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return WillPopScope(onWillPop: () async {
      context.read<GeneralCubit>().changePageDashboard(0);
      return true;
    }, child: Builder(builder: (context) {
      final user = context.watch<UserCubit>();
      final usermodel = context
          .select<UserCubit, UserModel>((value) => value.state.userModel);
      return SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: responsive.width > 300
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  crossAxisAlignment: responsive.width > 300
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    InfoCard(user: user, usermodel: usermodel),
                    const SizedBox(
                      height: 50,
                    ),
                    LastRecycler(usermodel: usermodel),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: UniCodes.cielperformance,
                          borderRadius: BorderRadius.circular(12)),
                      width: responsive.width > 350 ? 250 : 210,
                      child: PerformanceLabel(
                        backgrouudIcon: UniCodes.orangeperformance,
                        avaible: usermodel.activate ?? false,
                        text: usermodel.activate ?? false
                            ? "Notificacion de recoleccion activa"
                            : "Sin notificacion de recoleccion",
                        isDark: false,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (responsive.width < 1350)
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          FormAddRecycler(
                            controllerPlastico: controllerPlastico,
                            controllerMetal: controllerMetal,
                            controllerPapel: controllerPapel,
                            controllerCarton: controllerCarton,
                            controllerVidrio: controllerVidrio,
                            userModel: usermodel,
                          ),
                        ],
                      ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CalculateSuccess(
                          userModel: usermodel,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    if (responsive.width < 865)
                      SizedBox(
                        height: 250,
                        child: ListRecycler(
                          usermodel: usermodel,
                        ),
                      )
                  ],
                ),
                if (responsive.width > 865)
                  ListRecycler(
                    usermodel: usermodel,
                  ),
                if (responsive.width > 1350)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 180, left: 30, bottom: 20),
                    child: Column(
                      children: [
                        FormAddRecycler(
                          controllerPlastico: controllerPlastico,
                          controllerMetal: controllerMetal,
                          controllerPapel: controllerPapel,
                          controllerCarton: controllerCarton,
                          controllerVidrio: controllerVidrio,
                          userModel: usermodel,
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
