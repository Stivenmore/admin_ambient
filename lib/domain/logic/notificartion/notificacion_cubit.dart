import 'package:admin_ambient/data/datasource/user_datasource.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notificacion_state.dart';

class NotificacionCubit extends Cubit<NotificacionState> {
  final UserDataSource userDataSource;
  NotificacionCubit({required this.userDataSource})
      : super(NotificacionInitial());

  Future getActivateUser() async {
    try {
      emit(NotificacionLoading());
      final resp = await userDataSource.getActiveteTrue();

      List<UserModel> usermodel = resp.map((e) {
        Map<String, dynamic> map = e.data();
        map.addAll({"id": e.id});
        return UserModel.fromFirebase(map);
      }).toList();

      emit(NotificacionLoaded(userModel: usermodel));
    } catch (e) {
      emit(NotificacionError());
    }
  }

  Future setNotifierHomeUser(
      {required UserModel user,
      required UserModel manager,
      required String reasen,
      required List<UserModel> listCurrent}) async {
    try {
      emit(NotificacionLoading());
      await userDataSource.setUserTypeDown(user.id!);
      await userDataSource.setVisitHome(
          user: user, manager: manager, reasen: reasen);
      List<UserModel> newlist = listCurrent;
      newlist.remove(user);
      emit(NotificacionLoaded(userModel: newlist));
    } catch (e) {
      emit(NotificacionError());
    }
  }
}
