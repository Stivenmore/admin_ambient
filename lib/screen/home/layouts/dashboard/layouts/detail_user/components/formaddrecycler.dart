import 'package:admin_ambient/domain/logic/user/user_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class FormAddRecycler extends StatefulWidget {
  const FormAddRecycler(
      {Key? key,
      required this.controllerPlastico,
      required this.controllerMetal,
      required this.controllerPapel,
      required this.controllerCarton,
      required this.controllerVidrio,
      required this.userModel})
      : super(key: key);

  final TextEditingController controllerPlastico;
  final TextEditingController controllerMetal;
  final TextEditingController controllerPapel;
  final TextEditingController controllerCarton;
  final TextEditingController controllerVidrio;
  final UserModel userModel;

  @override
  State<FormAddRecycler> createState() => _FormAddRecyclerState();
}

class _FormAddRecyclerState extends State<FormAddRecycler> {
  final RoundedLoadingButtonController controller =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final value = context.select<UserCubit, StatePointsUp>(
          (value) => value.state.statePointsUp);
      if (value == StatePointsUp.loaded) {
        controller.success();
        Future.delayed(const Duration(seconds: 2), () {
          controller.reset();
        });
      }
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Agregar nuevo reciclaje",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                    color: UniCodes.blueperformance,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: widget.controllerPlastico,
                  scrollPadding: const EdgeInsets.all(0.0),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: UniCodes.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w800)),
                  cursorColor: UniCodes.green,
                  decoration: InputDecoration(
                    labelText: 'Plastico',
                    labelStyle: TextStyle(color: UniCodes.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusColor: UniCodes.green,
                    fillColor: UniCodes.green,
                  ),
                  validator: (String? value) =>
                      value!.isEmpty ? 'Ingrese un valor valido' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: widget.controllerMetal,
                  scrollPadding: const EdgeInsets.all(0.0),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: UniCodes.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w800)),
                  cursorColor: UniCodes.green,
                  decoration: InputDecoration(
                    labelText: 'Metal',
                    labelStyle: TextStyle(color: UniCodes.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusColor: UniCodes.green,
                    fillColor: UniCodes.green,
                  ),
                  validator: (String? value) =>
                      value!.isEmpty ? 'Ingrese un valor valido' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: widget.controllerPapel,
                  scrollPadding: const EdgeInsets.all(0.0),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: UniCodes.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w800)),
                  cursorColor: UniCodes.green,
                  decoration: InputDecoration(
                    labelText: 'Papel',
                    labelStyle: TextStyle(color: UniCodes.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusColor: UniCodes.green,
                    fillColor: UniCodes.green,
                  ),
                  validator: (String? value) =>
                      value!.isEmpty ? 'Ingrese un valor valido' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: widget.controllerCarton,
                  scrollPadding: const EdgeInsets.all(0.0),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: UniCodes.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w800)),
                  cursorColor: UniCodes.green,
                  decoration: InputDecoration(
                    labelText: 'Carton',
                    labelStyle: TextStyle(color: UniCodes.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusColor: UniCodes.green,
                    fillColor: UniCodes.green,
                  ),
                  validator: (String? value) =>
                      value!.isEmpty ? 'Ingrese un valor valido' : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: widget.controllerVidrio,
                  scrollPadding: const EdgeInsets.all(0.0),
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: UniCodes.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w800)),
                  cursorColor: UniCodes.green,
                  decoration: InputDecoration(
                    labelText: 'Vidrio',
                    labelStyle: TextStyle(color: UniCodes.green),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: UniCodes.green),
                    ),
                    focusColor: UniCodes.green,
                    fillColor: UniCodes.green,
                  ),
                  validator: (String? value) =>
                      value!.isEmpty ? 'Ingrese un valor valido' : null,
                ),
                const SizedBox(
                  height: 25,
                ),
                RoundedLoadingButton(
                  color: const Color.fromARGB(255, 29, 62, 17),
                  controller: controller,
                  successColor: UniCodes.orangeperformance2,
                  onPressed: () async {
                    if (validation()) {
                      context.read<UserCubit>().addRecycler(
                          widget.userModel,
                          RecyclerModel(
                              time: DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()),
                              carton: int.parse(widget.controllerCarton.text),
                              metal: int.parse(widget.controllerMetal.text),
                              papel: int.parse(widget.controllerPapel.text),
                              plastico:
                                  int.parse(widget.controllerPlastico.text),
                              vidrio: int.parse(widget.controllerVidrio.text)));
                    } else {
                      controller.reset();
                    }
                  },
                  child: Text(
                    'Iniciar sesion',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  validation<bool>() {
    if (widget.controllerCarton.text.isNotEmpty &&
        widget.controllerMetal.text.isNotEmpty &&
        widget.controllerPapel.text.isNotEmpty &&
        widget.controllerPlastico.text.isNotEmpty &&
        widget.controllerVidrio.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
