import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/search/models/search_model.dart';
import 'package:meta/meta.dart';

import '../../../core/network/remote/apis_const.dart';
import '../../../core/network/remote/dioHelper.dart';
import '../../../core/network/remote/header_constance.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
 static SearchCubit get(context) => BlocProvider.of(context);

  String selectedFilter = "title"; // القيمة الافتراضية

  void changeFilter(String filter) {
    selectedFilter = filter;
    emit(SearchFilterChanged());
  }
  SearchModel ?searchModel ;
  void searchProperty({required String word}) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: ApiConstance.searchProperty,
      token: HeaderConstance.token,
      data: {
        if (selectedFilter == "title") ...{"title": word},
        if (selectedFilter == "price") ...{"price": word},
        if (selectedFilter == "property type") ...{"property_type": word},
        if (selectedFilter == "region") ...{"region": word},
        if (selectedFilter == "space") ...{"space": word},
      }
    ).then((value) {
      if (value.statusCode == 200) {
        searchModel = SearchModel.fromJson(value.data);
        emit(SearchSuccessState());
        print(value.data);
        print(selectedFilter);
      }
    }).catchError((e) {
      if (e is DioException) {
        if (e.response != null) {
          print("Error: ${e.response?.data}");

        } else {
          print("Error1: ${e.message}");
          print(word);
        }
      } else {
        print("Unexpected error: $e");
      }
      emit(SearchErrorState());
    });
  }

}
