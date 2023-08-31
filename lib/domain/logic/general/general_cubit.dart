import 'package:admin_ambient/data/datasource/user_datasource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'general_state.dart';

class GeneralCubit extends Cubit<GeneralState> {
  final UserDataSource userDataSource;
  GeneralCubit(this.userDataSource) : super(GeneralState());

  void changePageDashboard(int page) {
    emit(state.copyWith(currentPageDashboard: page));
  }

  void changeGlobalCurrentPage(int page) {
    emit(state.copyWith(globalcurrentpage: page));
  }

  void pricepoint() async {
    try {
      final int price = await userDataSource.getConfig();
      emit(state.copyWith(pricepoint: price));
    } catch (e) {
      //TODO
    }
  }
}
