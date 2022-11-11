import 'package:admin_ambient/data/datasource/analytics_datasource.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  final AnalyticsDataSource _analyticsDataSource;
  AnalyticsCubit(AnalyticsDataSource analyticsDataSource)
      : _analyticsDataSource = analyticsDataSource,
        super(AnalyticsState());

  Future getAllUserRegisterDay() async {
    emit(state.copywith(enumDay: AnalyticsStateEnumDay.loading));
    try {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> resp =
          await _analyticsDataSource
              .getAllUserRegisterDay(DateTime.now().day.toString());
      List<UserModel> userlist =
          resp.map((e) => UserModel.fromFirebase(e.data())).toList();
      if (userlist.isNotEmpty) {
        emit(state.copywith(
            analyticsDayUser: userlist,
            enumDay: AnalyticsStateEnumDay.success));
      } else {
        emit(state.copywith(enumDay: AnalyticsStateEnumDay.none));
      }
    } catch (e) {
      emit(state.copywith(enumDay: AnalyticsStateEnumDay.error));
    }
  }

  Future getAllUserRegisterMonth() async {
    emit(state.copywith(enumMonth: AnalyticsStateEnumMonth.loading));
    try {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> resp =
          await _analyticsDataSource
              .getAllUserRegisterMonth(DateTime.now().month.toString());
      List<UserModel> userlist =
          resp.map((e) => UserModel.fromFirebase(e.data())).toList();
      if (userlist.isNotEmpty) {
        emit(state.copywith(
            analyticsMonthUser: userlist,
            enumMonth: AnalyticsStateEnumMonth.success));
      } else {
        emit(state.copywith(enumMonth: AnalyticsStateEnumMonth.none));
      }
    } catch (e) {
      emit(state.copywith(enumMonth: AnalyticsStateEnumMonth.error));
    }
  }

  Future getAllUserRegisterYears() async {
    emit(state.copywith(enumYears: AnalyticsStateEnumYears.loading));
    try {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> resp =
          await _analyticsDataSource
              .getAllUserRegisterYear(DateTime.now().year.toString());
      List<UserModel> userlist =
          resp.map((e) => UserModel.fromFirebase(e.data())).toList();
      if (userlist.isNotEmpty) {
        emit(state.copywith(
            analyticsYearsUser: userlist,
            enumYears: AnalyticsStateEnumYears.success));
      } else {
        emit(state.copywith(enumYears: AnalyticsStateEnumYears.none));
      }
    } catch (e) {
      emit(state.copywith(enumYears: AnalyticsStateEnumYears.error));
    }
  }

  Future getAllLastUpdate() async {
    emit(state.copywith(enumUpdate: AnalyticsStateEnumUpdate.loading));
    try {
      final bool avaiblePodcast = await _analyticsDataSource.avaiblePodcast();
      final bool avaibleNote = await _analyticsDataSource.avaibleNotes();
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> resp =
          await _analyticsDataSource.getAllUserLastUpdateLogin(
              DateFormat("yyyy-MM-dd").format(DateTime.now()));
      List<UserModel> userlist =
          resp.map((e) => UserModel.fromFirebase(e.data())).toList();
      if (userlist.isNotEmpty) {
        emit(state.copywith(
            analyticsUpdateUser: userlist,
            enumUpdate: AnalyticsStateEnumUpdate.success,
            avaibleNotes: avaibleNote,
            avaiblePodcast: avaiblePodcast));
      } else {
        emit(state.copywith(enumUpdate: AnalyticsStateEnumUpdate.none));
      }
    } catch (e) {
      emit(state.copywith(enumUpdate: AnalyticsStateEnumUpdate.error));
    }
  }
}
