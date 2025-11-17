import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/areas/models/area_model.dart';
import 'package:meta/meta.dart';

import '../../../core/network/remote/apis_const.dart';
import '../../../core/network/remote/dioHelper.dart';
import '../../../core/network/remote/header_constance.dart';

part 'areas_state.dart';

class AreasCubit extends Cubit<AreasState> {
  AreasCubit() : super(AreasInitial());
  static AreasCubit get(context) => BlocProvider.of(context);

  List<AreaModel> areas =[];
  void getAreasToState({required stateId}) {
    emit(GetAreasLoadingState());
    print("loading state");
    DioHelper.getData(
      url: "${ApiConstance.getAreasToState}$stateId",
      token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200) {
        value.data.forEach((element) {
          areas.add(AreaModel.fromJson(element));
        });
        emit(GetAreasSuccessState());
       // print(areas[0]);
      }
    }).catchError((e) {
      if (e is DioException) {
        if (e.response != null) {
          print("Error: ${e.response?.data}");
        } else {
          print("Error1: ${e.message}");
        }
      } else {
        print("Unexpected error: $e");
      }
      emit(GetAreasErrorState());
    });
  }
}
