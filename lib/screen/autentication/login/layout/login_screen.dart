import 'package:admin_ambient/domain/logic/signIn_signUp/sign_in_and_sign_up_cubit.dart';
import 'package:admin_ambient/screen/utils/global_functions/global_functions.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:admin_ambient/screen/utils/validations/streamvalidator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController controller =
      RoundedLoadingButtonController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  IconData lock = CupertinoIcons.eye_slash;
  final registerBloc = RegisterBloc();
  bool obstru = true;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    SignInAndUpCubit cubit = context.watch<SignInAndUpCubit>();
    return WillPopScope(
      onWillPop: () async{
       return false; 
      },
      child: Scaffold(
        body: SizedBox(
          height: responsive.height,
          width: responsive.width,
          child: Row(
            mainAxisAlignment: responsive.isMobile? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                AnimatedContainer(
                duration: const Duration(milliseconds: 10),
                key: ValueKey(imageCalculateWidth(responsive)),
                height: responsive.height,
                width:  imageCalculateWidth(responsive),
                child: !responsive.isMobile? Image.asset('assets/Splash.png', fit: BoxFit.cover,): null,),
              SizedBox(
                width: responsive.isTablet? responsive.wp(10): 0,
              ),
              SizedBox(
                height: responsive.height,
                width: responsive.wp(50),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),  
                          SizedBox(
                            height: responsive.hp(2),
                          ),
                          Text(
                            'Iniciar ahora',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700)),
                          ),
                          SizedBox(
                            height: responsive.hp(0.5),
                          ),
                          Text(
                            'Por favor ingrese los detalles y continue.',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(color: UniCode.gray2)),
                          ),
                          SizedBox(
                            height: responsive.hp(2),
                          ),
                          SizedBox(
                            width: 400,
                            child: StreamBuilder(
                                stream: registerBloc.emailStream,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  return TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: registerBloc.changeEmail,
                                    controller: email,
                                    scrollPadding: const EdgeInsets.all(0.0),
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800)),
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(
                                      labelText: 'Correo',
                                      errorMaxLines: 2,
                                      errorText: snapshot.error as String?,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                            BorderSide(color: UniCode.gray2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                            BorderSide(color: UniCode.gray2),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: UniCode.gray2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                            BorderSide(color: UniCode.gray2),
                                      ),
                                      focusColor: UniCode.gray2,
                                      fillColor: UniCode.gray2,
                                    ),
                                    validator: (String? value) => value!.isEmpty
                                        ? 'Ingresa tu correo'
                                        : null,
                                  );
                                }),
                          ),
                          SizedBox(
                            height: responsive.hp(2),
                          ),
                          SizedBox(
                            width: 400,
                            child: StreamBuilder(
                                stream: registerBloc.passwordStream,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  return TextFormField(
                                    obscureText: obstru,
                                    onChanged: registerBloc.changePassword,
                                    controller: password,
                                    scrollPadding: const EdgeInsets.all(0.0),
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800)),
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(
                                      labelText: 'Contraseña',
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              obstru = !obstru;
                                            });
                                            if (obstru == false) {
                                              setState(() {
                                                lock = CupertinoIcons.eye;
                                              });
                                            } else {
                                              setState(() {
                                                lock = CupertinoIcons.eye_slash;
                                              });
                                            }
                                          },
                                          icon: Icon(
                                            lock,
                                            color: Colors.black,
                                          )),
                                      errorMaxLines: 2,
                                      errorText: snapshot.error as String?,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                            BorderSide(color: UniCode.gray2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                            BorderSide(color: UniCode.gray2),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: UniCode.gray2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide:
                                            BorderSide(color: UniCode.gray2),
                                      ),
                                      focusColor: UniCode.gray2,
                                      fillColor: UniCode.gray2,
                                    ),
                                    validator: (String? value) => value!.isEmpty
                                        ? 'Ingresa tu contraseña'
                                        : null,
                                  );
                                }),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: paddingCalculateWidth(responsive)),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                },
                                child: Text(
                                  '¿Olvidaste tu contraseña?',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color:  Color.fromARGB(255, 29, 62, 17),
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: responsive.hp(1),
                          ),
                          StreamBuilder(
                              stream: registerBloc.formValidStream,
                              builder: (context, snapshot) {
                                return SizedBox(
                                  width: responsive.wp(70),
                                  child: RoundedLoadingButton(
                                    color: const Color.fromARGB(255, 29, 62, 17),
                                    controller: controller,
                                    onPressed: () async {
                                      if (snapshot.hasData &&
                                          _formKey.currentState!.validate()) {
                                        await cubit.signInMethod(
                                            email: email.text,
                                            password: password.text);
                                      } else {
                                        controller.reset();
                                      }
                                    },
                                    child: Text(
                                      'Iniciar sesion',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: responsive.hp(3),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/logup');
                            },
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'No tienes una cuenta! ',
                                  style:
                                      GoogleFonts.poppins(color: UniCode.gray3)),
                              TextSpan(
                                  text: 'Registrate',
                                  style: GoogleFonts.poppins(
                                      color: const Color.fromARGB(255, 29, 62, 17)))
                            ])),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(
                width: responsive.isTablet? responsive.wp(10): 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}