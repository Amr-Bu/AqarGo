part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
class ProfileImageSelected extends ProfileState {
  final File imageFile;
   ProfileImageSelected(this.imageFile);
}
class GetProfileSuccessState extends ProfileState {}
class GetProfileLoadingState extends ProfileState {}
class GetProfileErrorState extends ProfileState {}

class ProfileImageUploading extends ProfileState {}
class ProfileImageUploadSuccess extends ProfileState {}
class ProfileImageUploadError extends ProfileState {}

class LogOutloadingState extends ProfileState {}
class LogOutSuccessState extends ProfileState {}
class LogOutErrorState extends ProfileState {}

class DeletePropertyloadingState extends ProfileState {}
class DeletePropertySuccessState extends ProfileState {}
class DeletePropertyErrorState extends ProfileState {}