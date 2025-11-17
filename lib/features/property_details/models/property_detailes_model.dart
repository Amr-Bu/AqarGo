// class PropertyDetailesModel {
//   PropertyDetailesModel({
//     required this.property,
//   });
//
//   final Property? property;
//
//   PropertyDetailesModel copyWith({
//     Property? property,
//   }) {
//     return PropertyDetailesModel(
//       property: property ?? this.property,
//     );
//   }
//
//   factory PropertyDetailesModel.fromJson(Map<String, dynamic> json){
//     return PropertyDetailesModel(
//       property: json["property"] == null ? null : Property.fromJson(json["property"]),
//     );
//   }
//
// }

class PropertyDetailesModel {
  PropertyDetailesModel({
    required this.id,
    required this.userId,
    required this.regionId,
    required this.price,
    required this.space,
    required this.title,
    required this.descriptionProperty,
    required this.descriptionLocation,
    required this.contractType,
    required this.propertyCategory,
    required this.propertyType,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.isFavorite,
    required this.region,
    required this.office,
  });

  final int? id;
  final int? userId;
  final int? regionId;
  final int? price;
  final int? space;
  final String? title;
  final String? descriptionProperty;
  final String? descriptionLocation;
  final String? contractType;
  final String? propertyCategory;
  final String? propertyType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ImageJSon> images;
  final bool? isFavorite;
  final RegionJson? region;
  final OfficePropertyDetiaels? office;

  PropertyDetailesModel copyWith({
    int? id,
    int? userId,
    int? regionId,
    int? price,
    int? space,
    String? title,
    String? descriptionProperty,
    String? descriptionLocation,
    String? contractType,
    String? propertyCategory,
    String? propertyType,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<ImageJSon>? images,
    bool? isFavorite,
    RegionJson? region,
    OfficePropertyDetiaels? office,
  }) {
    return PropertyDetailesModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      regionId: regionId ?? this.regionId,
      price: price ?? this.price,
      space: space ?? this.space,
      title: title ?? this.title,
      descriptionProperty: descriptionProperty ?? this.descriptionProperty,
      descriptionLocation: descriptionLocation ?? this.descriptionLocation,
      contractType: contractType ?? this.contractType,
      propertyCategory: propertyCategory ?? this.propertyCategory,
      propertyType: propertyType ?? this.propertyType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      images: images ?? this.images,
      isFavorite: isFavorite ?? this.isFavorite,
      region: region ?? this.region,
      office: office ?? this.office,
    );
  }

  factory PropertyDetailesModel.fromJson(Map<String, dynamic> json){
    return PropertyDetailesModel(
      id: json["id"],
      userId: json["user_id"],
      regionId: json["region_id"],
      price: json["price"],
      space: json["space"],
      title: json["title"],
      descriptionProperty: json["description_property"],
      descriptionLocation: json["description_location"],
      contractType: json["contract_type"],
      propertyCategory: json["property_category"],
      propertyType: json["property_type"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      images: json["images"] == null ? [] : List<ImageJSon>.from(json["images"]!.map((x) => ImageJSon.fromJson(x))),
      isFavorite: json["is_favorite"],
      region: json["region"] == null ? null : RegionJson.fromJson(json["region"]),
      office: json["office"] == null ? null : OfficePropertyDetiaels.fromJson(json["office"]),
    );
  }

}

class ImageJSon {
  ImageJSon({
    required this.id,
    required this.propertyId,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? propertyId;
  final String? imagePath;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ImageJSon copyWith({
    int? id,
    int? propertyId,
    String? imagePath,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ImageJSon(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory ImageJSon.fromJson(Map<String, dynamic> json){
    return ImageJSon(
      id: json["id"],
      propertyId: json["property_id"],
      imagePath: json["image_path"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}

class OfficePropertyDetiaels {
  OfficePropertyDetiaels({
    required this.id,
    required this.officeName,
    required this.email,
    required this.description,
    required this.percentage,
    required this.image,
    required this.phoneNumberOffice,
  });

  final int? id;
  final String? officeName;
  final String? email;
  final String? description;
  final String? percentage;
  final String? image;
  final String? phoneNumberOffice;

  OfficePropertyDetiaels copyWith({
    int? id,
    String? officeName,
    String? email,
    String? description,
    String? percentage,
    String? image,
    String? phoneNumberOffice,
  }) {
    return OfficePropertyDetiaels(
      id: id ?? this.id,
      officeName: officeName ?? this.officeName,
      email: email ?? this.email,
      description: description ?? this.description,
      percentage: percentage ?? this.percentage,
      image: image ?? this.image,
      phoneNumberOffice: phoneNumberOffice ?? this.phoneNumberOffice,
    );
  }

  factory OfficePropertyDetiaels.fromJson(Map<String, dynamic> json){
    return OfficePropertyDetiaels(
      id: json["id"],
      officeName: json["office_name"],
      email: json["email"],
      description: json["description"],
      percentage: json["percentage"],
      image: json["image"],
      phoneNumberOffice: json["PhoneNumberOffice"],
    );
  }

}

class RegionJson {
  RegionJson({
    required this.id,
    required this.regionName,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
  });

  final int? id;
  final String? regionName;
  final int? stateId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final StateJson? state;

  RegionJson copyWith({
    int? id,
    String? regionName,
    int? stateId,
    DateTime? createdAt,
    DateTime? updatedAt,
    StateJson? state,
  }) {
    return RegionJson(
      id: id ?? this.id,
      regionName: regionName ?? this.regionName,
      stateId: stateId ?? this.stateId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      state: state ?? this.state,
    );
  }

  factory RegionJson.fromJson(Map<String, dynamic> json){
    return RegionJson(
      id: json["id"],
      regionName: json["region_name"],
      stateId: json["state_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      state: json["state"] == null ? null : StateJson.fromJson(json["state"]),
    );
  }

}

class StateJson {
  StateJson({
    required this.id,
    required this.stateName,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? stateName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  StateJson copyWith({
    int? id,
    String? stateName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StateJson(
      id: id ?? this.id,
      stateName: stateName ?? this.stateName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory StateJson.fromJson(Map<String, dynamic> json){
    return StateJson(
      id: json["id"],
      stateName: json["state_name"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
