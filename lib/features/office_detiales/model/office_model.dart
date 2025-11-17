class OfficeModel {
  OfficeModel({
    required this.office,
    required this.properties,
  });

  final Office? office;
  final List<OfficeProperty> properties;

  OfficeModel copyWith({
    Office? office,
    List<OfficeProperty>? properties,
  }) {
    return OfficeModel(
      office: office ?? this.office,
      properties: properties ?? this.properties,
    );
  }

  factory OfficeModel.fromJson(Map<String, dynamic> json){
    return OfficeModel(
      office: json["office"] == null ? null : Office.fromJson(json["office"]),
      properties: json["properties"] == null ? [] : List<OfficeProperty>.from(json["properties"]!.map((x) => OfficeProperty.fromJson(x))),
    );
  }

}

class Office {
  Office({
    required this.id,
    required this.officeName,
    required this.email,
    required this.description,
    required this.percentage,
    required this.image,
    required this.phoneNumberOffice,
    required this.isFollowing,
  });

  final int? id;
  final String? officeName;
  final String? email;
  final String? description;
  final String? percentage;
  final dynamic image;
  final String? phoneNumberOffice;
  final bool? isFollowing;

  Office copyWith({
    int? id,
    String? officeName,
    String? email,
    String? description,
    String? percentage,
    dynamic? image,
    String? phoneNumberOffice,
    bool? isFollowing,
  }) {
    return Office(
      id: id ?? this.id,
      officeName: officeName ?? this.officeName,
      email: email ?? this.email,
      description: description ?? this.description,
      percentage: percentage ?? this.percentage,
      image: image ?? this.image,
      phoneNumberOffice: phoneNumberOffice ?? this.phoneNumberOffice,
      isFollowing: isFollowing ?? this.isFollowing,
    );
  }

  factory Office.fromJson(Map<String, dynamic> json){
    return Office(
      id: json["id"],
      officeName: json["office_name"],
      email: json["email"],
      description: json["description"],
      percentage: json["percentage"],
      image: json["image"],
      phoneNumberOffice: json["PhoneNumberOffice"],
      isFollowing: json["is_following"],
    );
  }

}

class OfficeProperty {
  OfficeProperty({
    required this.id,
    required this.userId,
    required this.regionId,
    required this.price,
    required this.space,
    required this.descriptionProperty,
    required this.title,
    required this.descriptionLocation,
    required this.contractType,
    required this.propertyCategory,
    required this.propertyType,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.region,
    required this.officePropertyId,
    required this.isFavorite,
  });

  final int? id;
  final int? userId;
  final int? regionId;
  final int? price;
  final int? space;
  final String? descriptionProperty;
  final String? title;
  final dynamic descriptionLocation;
  final String? contractType;
  final String? propertyCategory;
  final String? propertyType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<OfficeImage> images;
  final Region? region;
  final int? officePropertyId;
  final bool? isFavorite;

  OfficeProperty copyWith({
    int? id,
    int? userId,
    int? regionId,
    int? price,
    int? space,
    String? descriptionProperty,
    String? title,
    dynamic? descriptionLocation,
    String? contractType,
    String? propertyCategory,
    String? propertyType,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<OfficeImage>? images,
    Region? region,
    int? officePropertyId,
    bool? isFavorite,
  }) {
    return OfficeProperty(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      regionId: regionId ?? this.regionId,
      price: price ?? this.price,
      space: space ?? this.space,
      descriptionProperty: descriptionProperty ?? this.descriptionProperty,
      title: title ?? this.title,
      descriptionLocation: descriptionLocation ?? this.descriptionLocation,
      contractType: contractType ?? this.contractType,
      propertyCategory: propertyCategory ?? this.propertyCategory,
      propertyType: propertyType ?? this.propertyType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      images: images ?? this.images,
      region: region ?? this.region,
      officePropertyId: officePropertyId ?? this.officePropertyId,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory OfficeProperty.fromJson(Map<String, dynamic> json){
    return OfficeProperty(
      id: json["id"],
      userId: json["user_id"],
      regionId: json["region_id"],
      price: json["price"],
      space: json["space"],
      descriptionProperty: json["description_property"],
      title: json["title"],
      descriptionLocation: json["description_location"],
      contractType: json["contract_type"],
      propertyCategory: json["property_category"],
      propertyType: json["property_type"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      images: json["images"] == null ? [] : List<OfficeImage>.from(json["images"]!.map((x) => OfficeImage.fromJson(x))),
      region: json["region"] == null ? null : Region.fromJson(json["region"]),
      officePropertyId: json["office_property_id"],
      isFavorite: json["is_favorite"],
    );
  }

}

class OfficeImage {
  OfficeImage({
    required this.propertyId,
    required this.imagePath,
  });

  final int? propertyId;
  final String? imagePath;

  OfficeImage copyWith({
    int? propertyId,
    String? imagePath,
  }) {
    return OfficeImage(
      propertyId: propertyId ?? this.propertyId,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  factory OfficeImage.fromJson(Map<String, dynamic> json){
    return OfficeImage(
      propertyId: json["property_id"],
      imagePath: json["image_path"],
    );
  }

}

class Region {
  Region({
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
  final State? state;

  Region copyWith({
    int? id,
    String? regionName,
    int? stateId,
    DateTime? createdAt,
    DateTime? updatedAt,
    State? state,
  }) {
    return Region(
      id: id ?? this.id,
      regionName: regionName ?? this.regionName,
      stateId: stateId ?? this.stateId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      state: state ?? this.state,
    );
  }

  factory Region.fromJson(Map<String, dynamic> json){
    return Region(
      id: json["id"],
      regionName: json["region_Name"],
      stateId: json["state_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      state: json["state"] == null ? null : State.fromJson(json["state"]),
    );
  }

}

class State {
  State({
    required this.id,
    required this.stateName,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? stateName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  State copyWith({
    int? id,
    String? stateName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return State(
      id: id ?? this.id,
      stateName: stateName ?? this.stateName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory State.fromJson(Map<String, dynamic> json){
    return State(
      id: json["id"],
      stateName: json["state_name"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
