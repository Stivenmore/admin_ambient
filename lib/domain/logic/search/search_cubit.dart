import 'package:admin_ambient/data/datasource/search_datasource.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchDatasource _searchDatasource;
  SearchCubit(SearchDatasource searchDatasource)
      : _searchDatasource = searchDatasource,
        super(SearchInitial());

  Future getQueryUsersSearch(String email) async {
    emit(SearchLoading());
    try {
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> resp =
          await _searchDatasource.getQueryForEmail(email);
      List<UserModel> usermodel =
          resp.map((e) => UserModel.fromFirebase(e.data())).toList();
      emit(SearchLoaded(usermodel));
    } catch (e) {
      emit(const SearchError("Error"));
    }
  }
}
