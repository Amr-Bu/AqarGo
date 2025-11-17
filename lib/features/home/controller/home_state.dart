part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
 class GetHomeDataLoading extends HomeState {}
 class GetHomeDataSuccess extends HomeState {}
 class GetHomeDataError extends HomeState {}
class AddToFavoriteLoadingState extends HomeState {}
class AddToFavoriteSuccessState extends HomeState {}
class AddToFavoriteErrorState extends HomeState {}

class RemoveFromFavoriteLoadingState extends HomeState {}
class RemoveFromFavoriteSuccessState extends HomeState {}
class RemoveFromFavoriteErrorState extends HomeState {}
class UpdateFavoriteUI extends HomeState {}
