import 'package:admin_ambient/data/datasource/user_datasource.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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

  void noneUser(UserModel userModel) {
    emit(state.copyWith(
        stateUserModelEnum: StateUserModelEnum.none, userModel: null));
  }

  resetState() {
    emit(state.copyWith(statePointsDown: StatePointsDown.none));
  }

  void removePoint(UserModel userModel, int newpoint) async {
    List<Map<String, dynamic>> map2 = [];
    List<Point> list2 = [
      ...userModel.points,
      Point(
          time: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          point: userModel.points.last.point - newpoint,
          type: "up")
    ];
    for (var i = 0; i < list2.length; i++) {
      map2.add({
        "point": list2[i].point,
        "time": list2[i].time,
        "type": list2[i].type
      });
    }

    try {
      final bool resp2 = await _userDataSource.setPoint(userModel.id!, map2);
      if (resp2) {
        emit(state.copyWith(
            statePointsDown: StatePointsDown.loaded,
            userModel: UserModel(
                nombre: userModel.nombre,
                email: userModel.email,
                transaction: <Transaction>[],
                recycler: userModel.recycler,
                id: userModel.id,
                points: list2,
                activate: userModel.activate,
                lastlogin: userModel.lastlogin)));
      } else {
        emit(state.copyWith(statePointsDown: StatePointsDown.loaded));
      }
    } catch (e) {
      emit(state.copyWith(statePointsDown: StatePointsDown.error));
    }
  }

  void addRecycler(UserModel userModel, RecyclerModel recyclerModel) async {
    emit(state.copyWith(statePointsUp: StatePointsUp.loading));
    List<Map<String, dynamic>> map = [];
    List<Map<String, dynamic>> map2 = [];
    List<RecyclerModel> list = [...userModel.recycler, recyclerModel];
    for (var i = 0; i < list.length; i++) {
      map.add({
        "carton": list[i].carton,
        "metal": list[i].metal,
        "papel": list[i].papel,
        "plastico": list[i].plastico,
        "time": list[i].time,
        "vidrio": list[i].vidrio
      });
    }
    try {
      final resp = await _userDataSource.setRecycler(userModel.id!, map);
      final int pointcurrent = await _userDataSource.getConfig();
      final int newpoint = (pointcurrent *
              (recyclerModel.carton +
                  recyclerModel.metal +
                  recyclerModel.papel +
                  recyclerModel.plastico +
                  recyclerModel.vidrio)) +
          userModel.transaction.last.point;

      List<Point> list2 = [
        ...userModel.points,
        Point(
            time: DateFormat('yyyy-MM-dd').format(DateTime.now()),
            point: newpoint,
            type: "up")
      ];
      for (var i = 0; i < list2.length; i++) {
        map2.add({
          "point": list2[i].point,
          "time": list2[i].time,
          "type": list2[i].type
        });
      }
      final resp2 = await _userDataSource.setPoint(userModel.id!, map2);
      if (resp && resp2) {
        emit(state.copyWith(statePointsUp: StatePointsUp.loaded));
        currenlyUserNow(userModel, list, list2);
      } else {
        emit(state.copyWith(statePointsUp: StatePointsUp.error));
      }
    } catch (e) {
      emit(state.copyWith(statePointsUp: StatePointsUp.error));
    }
  }

  void currenlyUserNow(
      UserModel userModel, List<RecyclerModel> recycler, List<Point> points) {
    emit(state.copyWith(
        stateUserModelEnum: StateUserModelEnum.loaded,
        userModel: UserModel(
            nombre: userModel.nombre,
            email: userModel.email,
            transaction: <Transaction>[],
            recycler: recycler,
            id: userModel.id,
            points: points,
            activate: userModel.activate,
            lastlogin: userModel.lastlogin)));
  }
}
