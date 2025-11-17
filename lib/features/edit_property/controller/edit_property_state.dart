// add_property_state.dart
part of 'edit_property_cubit.dart';

@immutable
sealed class EditPropertyState {}

final class EditPropertyInitial extends EditPropertyState {}

final class EditPropertyImagesUpdated extends EditPropertyState {}
final class EditPropertyPropertyTypeUpdated extends EditPropertyState {}
final class EditPropertyPropertyCategoryUpdated extends EditPropertyState {}
class EditPropertyLocationUpdated extends EditPropertyState {}
class EditPropertyPageChanged extends EditPropertyState {}

final class EditPropertyContractTypeUpdated extends EditPropertyState {}
