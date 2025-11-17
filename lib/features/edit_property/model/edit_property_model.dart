class EditPropertyModel {
  final int id;
  final String locationDesc;
  final String description;
  final double price;
  final double space;
  final String governorate;
  final String area;
  final String contractType;
  final String propertyType;
  final String propertyCategory;
  final List<String> imageUrls; // روابط الصور

  EditPropertyModel({
    required this.id,
    required this.locationDesc,
    required this.description,
    required this.price,
    required this.space,
    required this.governorate,
    required this.area,
    required this.contractType,
    required this.propertyType,
    required this.propertyCategory,
    required this.imageUrls,
  });

// يمكنك إضافة toJson, fromJson إذا تستخدم API
}
