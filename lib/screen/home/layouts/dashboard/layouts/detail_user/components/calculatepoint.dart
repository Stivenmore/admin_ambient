import 'package:admin_ambient/domain/logic/general/general_cubit.dart';
import 'package:admin_ambient/domain/logic/user/user_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CalculateSuccess extends StatefulWidget {
  final UserModel userModel;
  const CalculateSuccess({super.key, required this.userModel});

  @override
  State<CalculateSuccess> createState() => _CalculateSuccessState();
}

class _CalculateSuccessState extends State<CalculateSuccess> {
  final RoundedLoadingButtonController roundedcontroller =
      RoundedLoadingButtonController();
  TextEditingController controller = TextEditingController();
  final borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: UniCodes.gray2.withOpacity(0.5)));
  final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: UniCodes.gray2.withOpacity(0.5));
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GeneralCubit>();
    final usercubit = context.read<UserCubit>();
    return Builder(builder: (context) {
      final value2 = context.select<UserCubit, StatePointsDown>(
          (value2) => value2.state.statePointsDown);
      if (value2 == StatePointsDown.loaded) {
        roundedcontroller.success();
        Future.delayed(const Duration(seconds: 2), () {
          roundedcontroller.reset();
          usercubit.resetState();
        });
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text("Calculadora de puntos",
              style: GoogleFonts.roboto(
                  textStyle:
                      const TextStyle(fontSize: 18, color: Colors.black))),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: boxDecoration,
                  height: 50,
                  width: 100,
                  child: TextFormField(
                    controller: controller,
                    onChanged: (v) {
                      if (v.isNotEmpty) {
                        setState(() {
                          value = double.parse(v) * cubit.state.pricepoint;
                        });
                      } else {
                        setState(() {
                          value = 0.0;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        label: Text(
                          "Escriba...",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: UniCodes.blueperformance)),
                        ),
                        border: borderStyle,
                        errorBorder: borderStyle,
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle),
                  ),
                ),
                Text(
                  " x${cubit.state.pricepoint} ",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18, color: UniCodes.blueperformance)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: 100,
                  decoration: boxDecoration,
                  child: Text(
                    "  =  $value",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 18, color: UniCodes.blueperformance)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RoundedLoadingButton(
            width: 100,
            color: widget.userModel.points.last.point > 0
                ? controller.text.isNotEmpty &&
                        int.parse(controller.text) <
                            widget.userModel.points.last.point
                    ? const Color.fromARGB(255, 29, 62, 17)
                    : UniCodes.gray2.withOpacity(0.7)
                : UniCodes.gray2.withOpacity(0.7),
            controller: roundedcontroller,
            successColor: UniCodes.orangeperformance2,
            onPressed: widget.userModel.points.last.point > 0
                ? controller.text.isNotEmpty &&
                        int.parse(controller.text) <
                            widget.userModel.points.last.point
                    ? () {
                        usercubit.removePoint(
                            widget.userModel, int.parse(controller.text));
                      }
                    : null
                : null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Convertir en dinero',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      );
    });
  }
}
