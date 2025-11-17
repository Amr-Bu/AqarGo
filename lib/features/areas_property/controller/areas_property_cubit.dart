import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/areas_property/models/property_area_model.dart';
import 'package:meta/meta.dart';

import '../../../core/network/remote/apis_const.dart';
import '../../../core/network/remote/dioHelper.dart';
import '../../../core/network/remote/header_constance.dart';

part 'areas_property_state.dart';

class AreasPropertyCubit extends Cubit<AreasPropertyState> {
  AreasPropertyCubit() : super(AreasPropertyInitial());
  static AreasPropertyCubit get(context) => BlocProvider.of(context);

  List<PropertyAreaModel> propertys =[];
  void getPropertyToRegion({required areaId}) {
    emit(GetPropertyToAreaLoadingState());
    DioHelper.getData(
      url: "${ApiConstance.getPropertyToRegion}$areaId",
      token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200) {
        value.data.forEach((element) {
          propertys.add(PropertyAreaModel.fromJson(element));
        });
        emit(GetPropertyToAreaSuccessState());
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
      emit(GetPropertyToAreaErrorState());
    });
  }
}




