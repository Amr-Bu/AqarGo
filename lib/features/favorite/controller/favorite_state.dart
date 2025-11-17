part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class AddToFavoriteLoadingState extends FavoriteState {}
class AddToFavoriteSuccessState extends FavoriteState {}
class AddToFavoriteErrorState extends FavoriteState {}

class GetFavoriteLoadingState extends FavoriteState {}
class GetFavoriteSuccessState extends FavoriteState {}
class GetFavoriteErrorState extends FavoriteState {}

class RemoveFromFavoriteLoadingState extends FavoriteState {}
class RemoveFromFavoriteSuccessState extends FavoriteState {}
class RemoveFromFavoriteErrorState extends FavoriteState {}
