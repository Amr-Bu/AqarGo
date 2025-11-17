// add_property_state.dart
part of 'add_property_cubit.dart';

@immutable
sealed class AddPropertyState {}

final class AddPropertyInitial extends AddPropertyState {}
class AddPropertySuccess extends AddPropertyState{}
class AddPropertyError extends AddPropertyState{}
class AddPropertyLoading extends AddPropertyState{}

final class AddPropertyImagesUpdated extends AddPropertyState {}
final class AddPropertyPropertyTypeUpdated extends AddPropertyState {}
final class AddPropertyPropertyCategoryUpdated extends AddPropertyState {}
class AddPropertyLocationUpdated extends AddPropertyState {}
class AddPropertyPageChanged extends AddPropertyState {}
class AddPropertyChangeChooseOffices extends AddPropertyState {}
class GetOfficeLoading extends AddPropertyState{}
class GetOfficeSuccess extends AddPropertyState{}
class GetOfficeError extends AddPropertyState{}
class GetStateLoading extends AddPropertyState{}
class GetStateSuccess extends AddPropertyState{}
class GetStateError extends AddPropertyState{}
class GetRegionLoading extends AddPropertyState{}
class GetRegionSuccess extends AddPropertyState{}
class GetRegionError extends AddPropertyState{}
class AddPropertyContractTypeUpdated extends AddPropertyState {}

