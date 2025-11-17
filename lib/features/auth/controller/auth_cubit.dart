import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manzel/core/network/remote/apis_const.dart';
import 'package:manzel/core/network/remote/header_constance.dart';
import 'package:meta/meta.dart';
import '../../../core/component/navigator.dart';
import '../../../core/network/local/cachHelper.dart';
import '../../../core/network/remote/dioHelper.dart';
import '../../../main_screen/main_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);


  void login (String email,String password,context) {
    emit(LoginLoadState());

    DioHelper.postData(url: ApiConstance.login
        ,data: {
      "email":"$email",
      "password":"$password"
    }).then((value) {
      print('success1');

      if(value.statusCode ==200) {
        print('success');
        emit(LoginSuccessState());
        print(value.data["token"]);
        CacheHelper.saveData(key: "token", value:"${value.data["token"]}" ).then((valuee){
          if(valuee){
            HeaderConstance.token = value.data["token"];
            navigatTo(context: context, page: MainScreen());
            saveUserToken(fcmToken: HeaderConstance.fcmToken);
          }
        });
      }
    }).catchError(( e){
      if (e is DioException) {
        if (e.response != null) {
          print("Error: ${e.response?.data}");
        //  ShowTaost(msg:"الرجاء التأكد من صحة الايميل و كلمة السر", state: ToastState.ERORR);
        } else {
          print("Error: ${e.error}");
        //  ShowTaost(msg: "  تأكد من جودة الاتصال او صحة URL", state: ToastState.WARNING);
        }
      } else {
        print("Unexpected error: $e");
      //  ShowTaost(msg: "حدث خطأ غير متوقع", state: ToastState.ERORR);
      }
      emit(LoginErrorState());
    });
  }


  void register (String firstName,String lastName,String phone,String email,String password,String passwordConfirme,context) {
    emit(RegisterLoadState());
    DioHelper.postData(url: ApiConstance.register
        ,data: {
          "FirstName":"$firstName",
          "LastName":"$lastName",
          "PhoneNumber":"$phone",
          "email":"$email",
          "password":"$password",
        "c_password":"$passwordConfirme",
        }).then((value) {
      print('success1');
      if(value.statusCode ==201) {
        print('success');
        emit(RegisterSuccessState());
        print(value.data["token"]);
        CacheHelper.saveData(key: "token", value:"${value.data["token"]}" ).then((valuee){
          if(valuee){
            HeaderConstance.token = value.data["token"];
            navigatTo(context: context, page: MainScreen());
            saveUserToken(fcmToken: HeaderConstance.fcmToken);
          }
        });
      }
    }).catchError(( e){
      if (e is DioException) {
        if (e.response != null) {
          print("Error: ${e.response?.data}");
          //  ShowTaost(msg:"الرجاء التأكد من صحة الايميل و كلمة السر", state: ToastState.ERORR);
        } else {
          print("Error1: ${e.message}");
          //  ShowTaost(msg: "  تأكد من جودة الاتصال او صحة URL", state: ToastState.WARNING);
        }
      } else {
        print("Unexpected error: $e");
        //  ShowTaost(msg: "حدث خطأ غير متوقع", state: ToastState.ERORR);
      }
      emit(RegisterErrorState());
    });
  }

  void saveUserToken({required String fcmToken}) {
    emit(SaveTokenLoadingState());
    DioHelper.postData(
      url: ApiConstance.saveUserToken,
      token: HeaderConstance.token,
      data:{
        "fcm_token":"$fcmToken"
      }
    ).then((value) {
      if (value.statusCode == 200) {
        emit(SaveTokenSuccessState());
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
      emit(SaveTokenErrorState());
    });
  }



}
