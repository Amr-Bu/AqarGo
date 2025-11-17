import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/core/network/remote/dioHelper.dart';
import 'package:manzel/core/network/remote/header_constance.dart';
import 'package:manzel/features/office_detiales/model/office_model.dart';
import 'package:manzel/features/office_detiales/model/office_properties_model.dart';
import 'package:meta/meta.dart';

part 'office_detiales_state.dart';

class OfficeDetialesCubit extends Cubit<OfficeDetialesState> {
  OfficeDetialesCubit() : super(OfficeDetialesInitial());
  static OfficeDetialesCubit get(context) => BlocProvider.of(context);
  OfficeModel? officeModel;
  List<OfficeProperty>? residentalProperties;
  List<OfficeProperty>? commercialProperties;
  List<OfficeProperty>? industrialProperties;
  List<OfficeProperty>? agriculturalProperties;
  void getOfficeProperty({required int? id}){
    emit(GetOfficePropertyLoading());
    print(":$id");
    DioHelper.getData(url: ApiConstance.officeProperty(id),token: HeaderConstance.token,).then((value){
      if(value.statusCode==200){
        print(value.data);
        officeModel=OfficeModel.fromJson(value.data);
        if(officeModel!=null) {
          residentalProperties = [];
          commercialProperties = [];
          industrialProperties = [];
          agriculturalProperties = [];
          print(officeModel!.properties.length);
          print("su");
          officeModel?.properties.forEach((element) {
            if (element.propertyCategory == "residental") {
              residentalProperties?.add(element);
            } else if (element.propertyCategory == "commercial") {
              commercialProperties?.add(element);
            }
            else if (element.propertyCategory == "industrial") {
              industrialProperties?.add(element);
            }
            else if (element.propertyCategory == "agricultural") {
              agriculturalProperties?.add(element);
            }
          });

          emit(GetOfficePropertySuccess());
        }else {
          emit(GetOfficePropertyError());

        }
      }
      else{
        print("Error: ${value.data}");
        emit(GetOfficePropertyError());
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
      emit(GetOfficePropertyError());    });
  }
  void followOffice({required int id}) {
    officeModel = officeModel!.copyWith(
      office: officeModel!.office?.copyWith(isFollowing: true),
    );
    emit(OfficeFollowLoading());
    print(HeaderConstance.token);

    DioHelper.getData(
      url: ApiConstance.officeFollow(id),
      token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200) {
        print("ssucces: ");

        emit(OfficeFollowSuccess());
      } else {
        print("Error1: ");

        officeModel = officeModel!.copyWith(
          office: officeModel!.office?.copyWith(isFollowing: false),
        );
        emit(OfficeFollowError());
      }
    }).catchError((e) {
      print("Error1: ${e.message}");

      officeModel = officeModel!.copyWith(
        office: officeModel!.office?.copyWith(isFollowing: false),
      );
      emit(OfficeFollowError());
    });
  }

  void unFollowOffice({required int id}) {
    print(HeaderConstance.token);
    officeModel = officeModel!.copyWith(
      office: officeModel!.office?.copyWith(isFollowing: false),
    );
    emit(OfficeFollowLoading());

    DioHelper.deleteData(
      url: ApiConstance.officeUnFollow(id),
      token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200) {

        emit(OfficeFollowSuccess());
      } else {
        officeModel = officeModel!.copyWith(
          office: officeModel!.office?.copyWith(isFollowing: true),
        );
        emit(OfficeFollowError());
      }
    }).catchError((e) {
      officeModel = officeModel!.copyWith(
        office: officeModel!.office?.copyWith(isFollowing: true),
      );
      print(e);
      emit(OfficeFollowError());
    });
  }
  void toggleFavoriteLocally(int propertyId) {
  residentalProperties = residentalProperties!.map((property){
    if(property.officePropertyId==propertyId){
      return property.copyWith(isFavorite: !(property.isFavorite ?? false));
    }else{
      return property;
    }
  }).toList();
  commercialProperties = commercialProperties!.map((property){
    if(property.officePropertyId==propertyId){
      return property.copyWith(isFavorite: !(property.isFavorite ?? false));
    }else{
      return property;
    }
  }).toList();
  industrialProperties = industrialProperties!.map((property){
    if(property.officePropertyId==propertyId){
      return property.copyWith(isFavorite: !(property.isFavorite ?? false));
    }else{
      return property;
    }
  }).toList();
  agriculturalProperties = agriculturalProperties!.map((property){
    if(property.officePropertyId==propertyId){
      return property.copyWith(isFavorite: !(property.isFavorite ?? false));
    }else{
      return property;
    }
  }).toList();
  emit(UpdateFavoriteUI());
  }

  void revertFavorite(int propertyId) {
    toggleFavoriteLocally(propertyId);
  }

  void addToFavorite({required int propertyId}) {
    print(propertyId);
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
        print("e.toString()");
        revertFavorite(propertyId);
        emit(AddToFavoriteErrorState());
      }
    }).catchError((e) {
      print(e.toString());
      revertFavorite(propertyId);
      emit(AddToFavoriteErrorState());
    });
  }

  void removeFromFavorite({required int propertyId}) {
    print(propertyId);

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
        print("erorrRemove");
        revertFavorite(propertyId);
        emit(RemoveFromFavoriteErrorState());
      }
    }).catchError((e) {
      print(e.toString());
      revertFavorite(propertyId);
      emit(RemoveFromFavoriteErrorState());
    });
  }

}
