import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'general_state.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralState());

  void changePageDashboard(int page) {
    emit(state.copyWith(currentPageDashboard: page));
  }
}
