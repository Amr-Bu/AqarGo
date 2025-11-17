part of 'areas_property_cubit.dart';

@immutable
sealed class AreasPropertyState {}

 class AreasPropertyInitial extends AreasPropertyState {}

class GetPropertyToAreaLoadingState extends AreasPropertyState {}
class GetPropertyToAreaSuccessState extends AreasPropertyState {}
class GetPropertyToAreaErrorState extends AreasPropertyState {}
