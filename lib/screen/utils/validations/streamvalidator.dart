// ignore_for_file: file_names

import 'dart:async';
import 'package:admin_ambient/screen/utils/validations/regexp.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

//   // Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => Rx.combineLatest2(
      emailStream, passwordStream, (dynamic e, dynamic p) => true);

//   // Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

//   // Obtener el último valor ingresado a los streams
// con validacion de si es nulo o no
  String? get email => _emailController.value;
  String? get password => _passwordController.value;

//Liberacion de flujos
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}