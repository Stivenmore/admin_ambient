import 'dart:async';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{1,}))$';
    RegExp regExp =  RegExp(pattern as String);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    Pattern pattern =
        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&<>+])[A-Za-z\d@$!%*#?&<>+]{8,}$";
    RegExp regExp =  RegExp(pattern as String);

    if (regExp.hasMatch(password)) {
      sink.add(password);
    } else {
      sink.addError(
          'tu contraseña debe tener caracter especial, letras, mas de 8 caracteres');
    }
  });

  final validarletras = StreamTransformer<String, String>.fromHandlers(
      handleData: (text, sink) {
    Pattern pattern =
       r'^[ A-Za-zäÄëËïÏöÖüÜáéíóúáéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙ. ]+$';
    RegExp regExp =  RegExp(pattern as String);
    if (regExp.hasMatch(text)) {
      sink.add(text);
    } else {
      sink.addError(
          'Caracter no valido');
    }
  });
  
  final validarURL = StreamTransformer<String, String>.fromHandlers(
      handleData: (text, sink) {
    Pattern pattern =
       r'^[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$';
    RegExp regExp =  RegExp(pattern as String);
    if (regExp.hasMatch(text)) {
      sink.add(text);
    } else {
      sink.addError(
          'Url no valida');
    }
  });
}