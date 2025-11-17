part of 'office_detiales_cubit.dart';

@immutable
sealed class OfficeDetialesState {}

final class OfficeDetialesInitial extends OfficeDetialesState {}
class GetOfficePropertyLoading extends OfficeDetialesState {}
class GetOfficePropertySuccess extends OfficeDetialesState {}
class GetOfficePropertyError extends OfficeDetialesState {}

class OfficeFollowLoading extends OfficeDetialesState {}
class OfficeFollowSuccess extends OfficeDetialesState {}
class OfficeFollowError extends OfficeDetialesState {}


class AddToFavoriteLoadingState extends OfficeDetialesState {}
class AddToFavoriteSuccessState extends OfficeDetialesState {}
class AddToFavoriteErrorState extends OfficeDetialesState {}

class RemoveFromFavoriteLoadingState extends OfficeDetialesState {}
class RemoveFromFavoriteSuccessState extends OfficeDetialesState {}
class RemoveFromFavoriteErrorState extends OfficeDetialesState {}
class UpdateFavoriteUI extends OfficeDetialesState {}
