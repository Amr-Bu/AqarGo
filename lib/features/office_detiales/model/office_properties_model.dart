// class OfficePropertiesModel {
//   OfficePropertiesModel({
//     required this.id,
//     required this.userId,
//     required this.regionId,
//     required this.price,
//     required this.space,
//     required this.descriptionProperty,
//     required this.title,
//     required this.descriptionLocation,
//     required this.contractType,
//     required this.propertyCategory,
//     required this.propertyType,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.pivot,
//   });
//
//   final int? id;
//   final int? userId;
//   final int? regionId;
//   final int? price;
//   final int? space;
//   final String? descriptionProperty;
//   final String? title;
//   final String? descriptionLocation;
//   final String? contractType;
//   final String? propertyCategory;
//   final String? propertyType;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final Pivot? pivot;
//
//   OfficePropertiesModel copyWith({
//     int? id,
//     int? userId,
//     int? regionId,
//     int? price,
//     int? space,
//     String? descriptionProperty,
//     String? title,
//     String? descriptionLocation,
//     String? contractType,
//     String? propertyCategory,
//     String? propertyType,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     Pivot? pivot,
//   }) {
//     return OfficePropertiesModel(
//       id: id ?? this.id,
//       userId: userId ?? this.userId,
//       regionId: regionId ?? this.regionId,
//       price: price ?? this.price,
//       space: space ?? this.space,
//       descriptionProperty: descriptionProperty ?? this.descriptionProperty,
//       title: title ?? this.title,
//       descriptionLocation: descriptionLocation ?? this.descriptionLocation,
//       contractType: contractType ?? this.contractType,
//       propertyCategory: propertyCategory ?? this.propertyCategory,
//       propertyType: propertyType ?? this.propertyType,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//       pivot: pivot ?? this.pivot,
//     );
//   }
//
//   factory OfficePropertiesModel.fromJson(Map<String, dynamic> json){
//     return OfficePropertiesModel(
//       id: json["id"],
//       userId: json["user_id"],
//       regionId: json["region_id"],
//       price: json["price"],
//       space: json["space"],
//       descriptionProperty: json["description_property"],
//       title: json["title"],
//       descriptionLocation: json["description_location"],
//       contractType: json["contract_type"],
//       propertyCategory: json["property_category"],
//       propertyType: json["property_type"],
//       createdAt: DateTime.tryParse(json["created_at"] ?? ""),
//       updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
//       pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
//     );
//   }
//
// }
//
// class Pivot {
//   Pivot({
//     required this.officeId,
//     required this.propertyId,
//     required this.price,
//     required this.status,
//     required this.isFeatured,
//   });
//
//   final int? officeId;
//   final int? propertyId;
//   final String? price;
//   final String? status;
//   final int? isFeatured;
//
//   Pivot copyWith({
//     int? officeId,
//     int? propertyId,
//     String? price,
//     String? status,
//     int? isFeatured,
//   }) {
//     return Pivot(
//       officeId: officeId ?? this.officeId,
//       propertyId: propertyId ?? this.propertyId,
//       price: price ?? this.price,
//       status: status ?? this.status,
//       isFeatured: isFeatured ?? this.isFeatured,
//     );
//   }
//
//   factory Pivot.fromJson(Map<String, dynamic> json){
//     return Pivot(
//       officeId: json["office_id"],
//       propertyId: json["property_id"],
//       price: json["price"],
//       status: json["status"],
//       isFeatured: json["is_featured"],
//     );
//   }
//
// }
