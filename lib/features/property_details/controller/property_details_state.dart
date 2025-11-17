part of 'property_details_cubit.dart';

@immutable
abstract class PropertyDetailsState extends Equatable{}

class PropertyDetailsInitial extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PropertyImageChanged extends PropertyDetailsState {
  final List<String> images;
  final int selectedIndex;

  PropertyImageChanged({required this.images, required this.selectedIndex});

  @override
  // TODO: implement props
  List<Object?> get props => [images,selectedIndex];
}
class GetPropertyDetailsLoading extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetPropertyDetailsSuccess extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props =>[];


}
class GetPropertyDetailsError extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AddToFavoriteLoadingState extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AddToFavoriteSuccessState extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AddToFavoriteErrorState extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RemoveFromFavoriteLoadingState extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RemoveFromFavoriteSuccessState extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class RemoveFromFavoriteErrorState extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UpdateFavoriteUI extends PropertyDetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
