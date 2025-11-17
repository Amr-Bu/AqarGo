import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:manzel/core/network/local/cachHelper.dart';
import 'package:manzel/features/favorite/favorite.dart';
import 'package:manzel/features/home/home.dart';
import 'package:manzel/features/profile/controller/profile_cubit.dart';
import 'package:manzel/features/profile/profile_screen.dart';
import 'package:manzel/features/search/search_screen.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex =0;

  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.search,
    Icons.favorite_border,
    Icons.person_outline,
  ];
  List<Widget> bottomScreens =[
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];
  void ChangeBottom(index){
    currentIndex=index;
    emit(ChangeNavegaitionIndex());
  }

  Locale locale=CacheHelper.getData(key: 'language')!=null? Locale(CacheHelper.getData(key: 'language')): Locale('en');
  void changeLanguage ({required Locale locale
  })async{
    locale = locale;
    await CacheHelper.saveData(key: "language", value: locale.languageCode).then((value){
      emit(ChangeLanguageState(locale: locale));

    });}

}
