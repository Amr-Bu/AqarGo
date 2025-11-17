part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
 class LoginLoadState extends AuthState {}
 class LoginSuccessState extends AuthState {}
 class LoginErrorState extends AuthState {}

class RegisterLoadState extends AuthState {}
class RegisterSuccessState extends AuthState {}
class RegisterErrorState extends AuthState {}

class SaveTokenLoadingState extends AuthState {}
class SaveTokenSuccessState extends AuthState {}
class SaveTokenErrorState extends AuthState {}