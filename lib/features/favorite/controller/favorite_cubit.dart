import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/features/favorite/models/favorites_model.dart';
import 'package:meta/meta.dart';

import '../../../core/network/remote/apis_const.dart';
import '../../../core/network/remote/dioHelper.dart';
import '../../../core/network/remote/header_constance.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);

        void addToFavorite({required int propertyId}) {
          emit(AddToFavoriteLoadingState());
          DioHelper.postData(
              url: ApiConstance.addToFavorite,
              token: HeaderConstance.token,
              data: {
                "office_property_id":"$propertyId"
              }
          ).then((value) {
            if (value.statusCode == 200) {
              emit(AddToFavoriteSuccessState());
        print("Success");
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
      emit(AddToFavoriteErrorState());
    });
  }
  void removeFromFavorite({required int propertyId}) {
    emit(RemoveFromFavoriteLoadingState());
    DioHelper.postData(
        url: ApiConstance.removeFromFavorite,
        token: HeaderConstance.token,
        data: {
          "office_property_id":"$propertyId"
        }
    ).then((value) {
      if (value.statusCode == 200) {
        emit(RemoveFromFavoriteSuccessState());
        print("Success remove");
        getFavorite();
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
      emit(RemoveFromFavoriteErrorState());
    });
  }

  FavoritesModel? favoritesModel  ;
  void getFavorite() {
    emit(GetFavoriteLoadingState());
    DioHelper.getData(
        url: ApiConstance.getFavorite,
        token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200) {
        favoritesModel = FavoritesModel.fromJson(value.data);
        emit(GetFavoriteSuccessState());
        print(favoritesModel?.message);
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
      emit(GetFavoriteErrorState());
    });
  }


}
