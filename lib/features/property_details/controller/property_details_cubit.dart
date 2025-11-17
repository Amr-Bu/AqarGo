import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/core/network/remote/dioHelper.dart';
import 'package:manzel/core/network/remote/header_constance.dart';
import 'package:manzel/features/property_details/models/property_detailes_model.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';
part 'property_details_state.dart';


class PropertyDetailsCubit extends Cubit<PropertyDetailsState> {
   List<String> images= [
  ];

  int selectedIndex = 0;
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();

  PropertyDetailsCubit():super(PropertyDetailsInitial());

  static PropertyDetailsCubit get(context) => BlocProvider.of(context);
  PropertyDetailesModel? propertyDetailes ;


  void selectImage(int index) {
    if (index >= 0 && index < images.length) {
      selectedIndex = index;
      _scrollToSelectedIndex(index);
      pageController.jumpToPage(index);

      emit(PropertyImageChanged(images: images, selectedIndex: selectedIndex));
    }
  }
  void _scrollToSelectedIndex(int index) {
    const itemHeight = 98.0;
    final offset = itemHeight * index - 60;

    if (scrollController.hasClients) {
      scrollController.animateTo(
        offset < 0 ? 0 : offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print("erorr");
    }
  }

  void getPropertyDetailes({required int id}) {
    emit(GetPropertyDetailsLoading());
    DioHelper.getData(url: ApiConstance.getPropertyDetailes(id),token: HeaderConstance.token).then((value){
      if(value.statusCode==200){
        propertyDetailes=PropertyDetailesModel.fromJson(value.data['property']);
        images = [];
        propertyDetailes?.images.forEach((e){
          images.add(e.imagePath??'');
        });
        print(value.data['property']);
        emit(GetPropertyDetailsSuccess());
      }
      else{
        print("Error: ${value.data}");
        emit(GetPropertyDetailsError());
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
      emit(GetPropertyDetailsError());    });
  }
   void toggleFavoriteLocally(int propertyId) {
    propertyDetailes=propertyDetailes?.copyWith(
        isFavorite: !(propertyDetailes?.isFavorite ?? false)
    );
     emit(UpdateFavoriteUI());
   }

   void revertFavorite(int propertyId) {
     toggleFavoriteLocally(propertyId);
   }

   void addToFavorite({required int propertyId}) {
     toggleFavoriteLocally(propertyId);
     emit(AddToFavoriteLoadingState());
 print("add");
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
     print("remove");
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
       print(e.toString());
       emit(RemoveFromFavoriteErrorState());
     });
   }

}
