part of 'areas_cubit.dart';

@immutable
sealed class AreasState {}

class AreasInitial extends AreasState {}

class GetAreasLoadingState extends AreasState {}
class GetAreasSuccessState extends AreasState {}
class GetAreasErrorState extends AreasState {}
