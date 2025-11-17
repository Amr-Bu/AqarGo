part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
class SearchFilterChanged extends SearchState {}

class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {}
class SearchErrorState extends SearchState {}