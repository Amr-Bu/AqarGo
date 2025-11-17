import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manzel/core/component/navigator.dart';
import 'package:manzel/core/network/remote/header_constance.dart';
import 'package:manzel/features/auth/login.dart';
import 'package:manzel/features/profile/models/profile_model.dart';
import 'package:meta/meta.dart';
import 'package:http_parser/http_parser.dart'; // لاستعمال MediaType
import '../../../core/network/local/cachHelper.dart';
import '../../../core/network/remote/apis_const.dart';
import '../../../core/network/remote/dioHelper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  final ImagePicker _picker = ImagePicker();

  File? selectedImage;
  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      emit(ProfileImageSelected(selectedImage!));
    }
  }
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  ProfileModel? profileModel;

  void getProfileData() {
    emit(GetProfileLoadingState());
    DioHelper.postData(
      url: ApiConstance.profileData,
      token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200) {
        profileModel = ProfileModel.fromJson(value.data);
        emit(GetProfileSuccessState());
        print("${value.data["user"]}");
        print("${profileModel?.user.FirstName}");
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
      emit(GetProfileErrorState());
    });
  }


  Future<void> uploadProfileImage({required int userId}) async {
    if (selectedImage == null) {
      print("No image selected");
      return;
    }

    emit(ProfileImageUploading());

    try {
      String fileName = selectedImage!.path.split('/').last;

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          selectedImage!.path,
          filename: fileName,
          contentType: MediaType('image', 'jpeg'),
        ),
      });

      final response = await DioHelper.postData(
        url: "${ApiConstance.uploadProfileImage}${userId}",
        data: formData,
        token: HeaderConstance.token,
      );

      if (response.statusCode == 200|| response.statusCode == 201) {
         getProfileData();
        emit(ProfileImageUploadSuccess());
        print("Upload success: ${response.data}");
      } else {
        emit(ProfileImageUploadError());
        print("Upload failed: ${response.statusCode}");
      }
    } catch (e) {
      emit(ProfileImageUploadError());
      print("Upload error: $e");
    }
  }


  void editProfileData(String firstName,String lastName, String phone) {
    emit(GetProfileLoadingState());
    DioHelper.postData(
      url: ApiConstance.profileData,
      token: HeaderConstance.token,
      data: {
        "FirstName":"$firstName",
        "LastName":"$lastName",
        "PhoneNumber":"$phone"
      }
    ).then((value) {
      if (value.statusCode == 200) {
        profileModel = ProfileModel.fromJson(value.data);

        emit(GetProfileSuccessState());
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
      emit(GetProfileErrorState());
    });
  }

  void logOut(context) {
    emit(LogOutloadingState());
    DioHelper.postData(
      url: ApiConstance.logOut,
      token: HeaderConstance.token,
    ).then((value) async {
       if (value.statusCode == 200) {
        CacheHelper.removeData(key: "token");
        HeaderConstance.token = "";
       await _messaging.deleteToken();
       HeaderConstance.fcmToken="${await _messaging.getToken()}";
        print(HeaderConstance.fcmToken);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Login()),
              (Route<dynamic> route) => false, // يمنع الرجوع نهائيًا
        );
        emit(LogOutSuccessState());
        print("${value.data}");
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
      emit(LogOutErrorState());
    });
  }

  void deleteProperty(dynamic propertyId) {
    emit(DeletePropertyloadingState());
    print("delet loading");
    DioHelper.deleteData(
      url: "${ApiConstance.deleteProperty}$propertyId",
      token: HeaderConstance.token,
    ).then((value) {
      if (value.statusCode == 200||value.statusCode == 201 ) {
        print("delete success");
        emit(DeletePropertySuccessState());
        getProfileData();
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
      emit(DeletePropertyErrorState());
    });
  }


}
