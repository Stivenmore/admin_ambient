import 'package:admin_ambient/data/datasource/user_datasource.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserDataSource _userDataSource;
  UserCubit(UserDataSource userDataSource)
      : _userDataSource = userDataSource,
        super(UserState());

  void currenlyUser(UserModel userModel) {
    emit(state.copyWith(
        stateUserModelEnum: StateUserModelEnum.loaded, userModel: userModel));
  }
}
