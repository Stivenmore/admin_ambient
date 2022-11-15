import 'package:admin_ambient/domain/logic/notes/notes_cubit.dart';
import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/domain/models/notes_model.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/notes/components/all_listnotes.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  int current = 0;

  @override
  void initState() {
    context.read<NotesCubit>().getAllNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return WillPopScope(onWillPop: () async {
      return false;
    }, child: Builder(builder: (context) {
      NotesStateEnum state = context.select<NotesCubit, NotesStateEnum>(
          (value) => value.state.notesStateEnum);
      return SizedBox(
          height: responsive.height,
          width: responsive.width,
          child: ListView(
            children: [
              if (responsive.width < 660)
                CreateNotes(
                  responsive: responsive,
                ),
              Row(
                children: [
                  if (state == NotesStateEnum.success)
                    AllListNotes(responsive: responsive),
                  if (state == NotesStateEnum.loading)
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        color: UniCodes.orangeperformance2,
                        backgroundColor: UniCodes.whiteperformance,
                      ),
                    ),
                  if (responsive.width > 660)
                    CreateNotes(
                      responsive: responsive,
                    )
                ],
              ),
            ],
          ));
    }));
  }
}

class CreateNotes extends StatefulWidget {
  const CreateNotes({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController problem = TextEditingController();
  final RoundedLoadingButtonController controller =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    UserModel usermodel = context.read<SignInAndUpCubit>().usermodelCubit;
    return Builder(builder: (context) {
      final state = context.select<NotesCubit, NotesUploadEnum>(
          (value) => value.state.notesUploadEnum);
      switch (state) {
        case NotesUploadEnum.loading:
          controller.start();
          break;
        case NotesUploadEnum.success:
          controller.success();
          Future.delayed(const Duration(seconds: 2), () {
            controller.reset();
          });
          break;
        case NotesUploadEnum.error:
          controller.error();
          break;
        default:
      }
      return Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10),
        child: SizedBox(
          height: widget.responsive.height,
          width: widget.responsive.wp(40),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 5),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: name,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: UniCodes.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w800)),
                    cursorColor: UniCodes.green,
                    decoration: InputDecoration(
                      hintText: "Nombre de la nota",
                      errorMaxLines: 2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      focusColor: UniCodes.green,
                      fillColor: UniCodes.green,
                    ),
                    validator: (String? value) =>
                        value!.isEmpty ? 'Nombre del' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 5),
                child: SizedBox(
                  height: 300,
                  child: TextFormField(
                    maxLines: 40,
                    keyboardType: TextInputType.emailAddress,
                    controller: description,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: UniCodes.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w800)),
                    cursorColor: UniCodes.green,
                    decoration: InputDecoration(
                      hintText: "Descripcion de la nota",
                      errorMaxLines: 2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      focusColor: UniCodes.green,
                      fillColor: UniCodes.green,
                    ),
                    validator: (String? value) =>
                        value!.isEmpty ? 'Descripcion' : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 10),
                child: SizedBox(
                  height: 300,
                  child: TextFormField(
                    maxLines: 40,
                    keyboardType: TextInputType.emailAddress,
                    controller: problem,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: UniCodes.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w800)),
                    cursorColor: UniCodes.green,
                    decoration: InputDecoration(
                      hintText: "Problema actual",
                      errorMaxLines: 2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: UniCodes.gray2.withOpacity(0.3)),
                      ),
                      focusColor: UniCodes.green,
                      fillColor: UniCodes.green,
                    ),
                    validator: (String? value) =>
                        value!.isEmpty ? 'Problema' : null,
                  ),
                ),
              ),
              RoundedLoadingButton(
                width: 140,
                color: UniCodes.orangeperformance,
                controller: controller,
                successColor: UniCodes.orangeperformance,
                borderRadius: 6,
                onPressed: () async {
                  if (name.text.isNotEmpty &&
                      description.text.isNotEmpty &&
                      problem.text.isNotEmpty) {
                    context.read<NotesCubit>().setNewNotes(
                        name: name.text,
                        description: description.text,
                        problem: problem.text,
                        author: usermodel.nombre);
                    name.clear();
                    description.clear();
                    problem.clear();
                    name.text = "";
                    problem.text = "";
                    description.text = "";
                  } else {
                    controller.reset();
                  }
                },
                child: Text(
                  'Agregar',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
