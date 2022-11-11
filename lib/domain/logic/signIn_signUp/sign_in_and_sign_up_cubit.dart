import 'package:admin_ambient/data/datasource/autenticate_datasource.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_and_sign_up_state.dart';

class SignInAndUpCubit extends Cubit<SignInAndUpState> {
  final AutenticationDataSource _autenticationServices;
  SignInAndUpCubit(AutenticationDataSource autenticationServices)
      : _autenticationServices = autenticationServices,
        super(SignInAndUpInitial());

  UserModel get usermodelCubit => _autenticationServices.userModel == null
      ? UserModel(nombre: '', email: '')
      : _autenticationServices.userModel!;
  bool get isloadingGetuser => _autenticationServices.isLoadingGetUser;

  Future signUpMethod(
      {required String name,
      required String email,
      required String password}) async {
    try {
      emit(SignInAndUpLoading());
      Map? isSuccess = await _autenticationServices.register(
          email: email, password: password, fullname: name);
      if (isSuccess["bool"]) {
        emit(SignInAndUpLoaded(user: usermodelCubit));
      } else {
        emit(SignInAndUpError(message: isSuccess["message"]));
      }
    } catch (e) {
      emit(SignInAndUpError(message: e.toString()));
    }
  }

  Future signInMethod({required String email, required String password}) async {
    try {
      emit(SignInAndUpLoading());
      Map? isSuccess =
          await _autenticationServices.login(email: email, password: password);
      if (isSuccess["bool"]) {
        emit(SignInAndUpLoaded(user: usermodelCubit));
      } else {
        emit(SignInAndUpError(message: isSuccess["message"]));
      }
    } catch (e) {
      emit(const SignInAndUpError(message: 'Error'));
    }
  }

  Future signOutMethod() async {
    await _autenticationServices.signOut();
  }

  void initializate() {
    emit(SignInAndUpInitial());
  }
}
