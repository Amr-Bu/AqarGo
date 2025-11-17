part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

class ChangeNavegaitionIndex extends MainState{}
class ChangeLanguageState extends MainState {
  final Locale locale;
  ChangeLanguageState({required this.locale});

}