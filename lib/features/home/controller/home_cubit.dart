import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/core/network/remote/dioHelper.dart';
import 'package:manzel/core/network/remote/header_constance.dart';
import 'package:manzel/features/home/model/home_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel?homeModel;
  void getHomeData(){
    emit(GetHomeDataLoading());
    DioHelper.getData(url: ApiConstance.homeData,token: HeaderConstance.token).then((value){
      if(value.statusCode==200){
        homeModel=HomeModel.fromJson(value.data);
        print(value.data);
        print(homeModel?.commercialProperties.toString());
        emit(GetHomeDataSuccess());
      }
      else{
        print("Error: ${value.data}");
        emit(GetHomeDataError());
      }
    }).catchError((e){

      if (e is DioException) {
        if (e.response != null) {
          print("Error: ${e.response?.data}");

        } else {
          print("Error1: ${e.message}");

        }
      } else {
        print("Unexpected error: $e");

      }
      emit(GetHomeDataError());    });
  }
  void toggleFavoriteLocally(int propertyId) {
    homeModel = homeModel?.copyWith(
      residentalProperties: homeModel!.residentalProperties.map((property) {
        if (property.officePropertyId == propertyId) {
          return property.copyWith(isFavorite: !(property.isFavorite ?? false));
        }
        return property;
      }).toList(),
      commercialProperties: homeModel!.commercialProperties.map((property) {
        if (property.officePropertyId == propertyId) {
          return property.copyWith(isFavorite: !(property.isFavorite ?? false));
        }
        return property;
      }).toList(),
      agriculturalProperties: homeModel!.agriculturalProperties.map((property) {
        if (property.officePropertyId == propertyId) {
          return property.copyWith(isFavorite: !(property.isFavorite ?? false));
        }
        return property;
      }).toList(),
      industrialProperties: homeModel!.industrialProperties.map((property) {
        if (property.officePropertyId == propertyId) {
          return property.copyWith(isFavorite: !(property.isFavorite ?? false));
        }
        return property;
      }).toList(),
    );
    emit(UpdateFavoriteUI());
  }

  void revertFavorite(int propertyId) {
    toggleFavoriteLocally(propertyId);
  }

  void addToFavorite({required int propertyId}) {
    toggleFavoriteLocally(propertyId);
    emit(AddToFavoriteLoadingState());

    DioHelper.postData(
      url: ApiConstance.addToFavorite,
      token: HeaderConstance.token,
      data: {
        "office_property_id": "$propertyId"
      },
    ).then((value) {
      if (value.statusCode == 200) {
        emit(AddToFavoriteSuccessState());
      } else {
        revertFavorite(propertyId);
        emit(AddToFavoriteErrorState());
      }
    }).catchError((e) {
      revertFavorite(propertyId);
      emit(AddToFavoriteErrorState());
    });
  }

  void removeFromFavorite({required int propertyId}) {
    toggleFavoriteLocally(propertyId);
    emit(RemoveFromFavoriteLoadingState());

    DioHelper.postData(
      url: ApiConstance.removeFromFavorite,
      token: HeaderConstance.token,
      data: {
        "office_property_id": "$propertyId"
      },
    ).then((value) {
      if (value.statusCode == 200) {
        emit(RemoveFromFavoriteSuccessState());
      } else {
        revertFavorite(propertyId);
        emit(RemoveFromFavoriteErrorState());
      }
    }).catchError((e) {
      revertFavorite(propertyId);
      emit(RemoveFromFavoriteErrorState());
    });
  }

}
