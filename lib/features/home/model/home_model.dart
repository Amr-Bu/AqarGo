class HomeModel {
  HomeModel({
    required this.adverts,
    required this.states,
    required this.offices,
    required this.commercialProperties,
    required this.agriculturalProperties,
    required this.residentalProperties,
    required this.industrialProperties,
  });

  final List<Advert> adverts;
  final List<StateJson> states;
  final List<Office> offices;
  final List<AlProperty> commercialProperties;
  final List<AlProperty> agriculturalProperties;
  final List<AlProperty> residentalProperties;
  final List<AlProperty> industrialProperties;

  HomeModel copyWith({
    List<Advert>? adverts,
    List<StateJson>? states,
    List<Office>? offices,
    List<AlProperty>? commercialProperties,
    List<AlProperty>? agriculturalProperties,
    List<AlProperty>? residentalProperties,
    List<AlProperty>? industrialProperties,
  }) {
    return HomeModel(
      adverts: adverts ?? this.adverts,
      states: states ?? this.states,
      offices: offices ?? this.offices,
      commercialProperties: commercialProperties ?? this.commercialProperties,
      agriculturalProperties: agriculturalProperties ?? this.agriculturalProperties,
      residentalProperties: residentalProperties ?? this.residentalProperties,
      industrialProperties: industrialProperties ?? this.industrialProperties,
    );
  }

  factory HomeModel.fromJson(Map<String, dynamic> json){
    return HomeModel(
      adverts: json["adverts"] == null ? [] : List<Advert>.from(json["adverts"]!.map((x) => Advert.fromJson(x))),
      states: json["states"] == null ? [] : List<StateJson>.from(json["states"]!.map((x) => StateJson.fromJson(x))),
      offices: json["offices"] == null ? [] : List<Office>.from(json["offices"]!.map((x) => Office.fromJson(x))),
      commercialProperties: json["commercial_properties"] == null ? [] : List<AlProperty>.from(json["commercial_properties"]!.map((x) => AlProperty.fromJson(x))),
      agriculturalProperties: json["agricultural_properties"] == null ? [] : List<AlProperty>.from(json["agricultural_properties"]!.map((x) => AlProperty.fromJson(x))),
      residentalProperties: json["residental_properties"] == null ? [] : List<AlProperty>.from(json["residental_properties"]!.map((x) => AlProperty.fromJson(x))),
      industrialProperties: json["industrial_properties"] == null ? [] : List<AlProperty>.from(json["industrial_properties"]!.map((x) => AlProperty.fromJson(x))),
    );
  }

}

class Advert {
  Advert({
    required this.officePropertyId,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.createdTime,
    required this.propertyId,
    required this.userId,
    required this.regionId,
    required this.title,
    required this.contractType,
    required this.propertyType,
    required this.descriptionProperty,
    required this.descriptionLocation,
    required this.officeId,
    required this.officeName,
    required this.email,
    required this.password,
    required this.description,
    required this.percentage,
    required this.image,
    required this.images,
    required this.followersCount,
    required this.isFollowed,
  });

  final int? officePropertyId;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? isActive;
  final String? createdTime;
  final int? propertyId;
  final int? userId;
  final int? regionId;
  final String? title;
  final String? contractType;
  final String? propertyType;
  final String? descriptionProperty;
  final String? descriptionLocation;
  final int? officeId;
  final String? officeName;
  final String? email;
  final String? password;
  final String? description;
  final String? percentage;
  final String? image;
  final List<String> images;
  final int? followersCount;
  final bool? isFollowed;

  Advert copyWith({
    int? officePropertyId,
    DateTime? startDate,
    DateTime? endDate,
    int? isActive,
    String? createdTime,
    int? propertyId,
    int? userId,
    int? regionId,
    String? title,
    String? contractType,
    String? propertyType,
    String? descriptionProperty,
    String? descriptionLocation,
    int? officeId,
    String? officeName,
    String? email,
    String? password,
    String? description,
    String? percentage,
    String? image,
    List<String>? images,
    int? followersCount,
    bool? isFollowed,
  }) {
    return Advert(
      officePropertyId: officePropertyId ?? this.officePropertyId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
      createdTime: createdTime ?? this.createdTime,
      propertyId: propertyId ?? this.propertyId,
      userId: userId ?? this.userId,
      regionId: regionId ?? this.regionId,
      title: title ?? this.title,
      contractType: contractType ?? this.contractType,
      propertyType: propertyType ?? this.propertyType,
      descriptionProperty: descriptionProperty ?? this.descriptionProperty,
      descriptionLocation: descriptionLocation ?? this.descriptionLocation,
      officeId: officeId ?? this.officeId,
      officeName: officeName ?? this.officeName,
      email: email ?? this.email,
      password: password ?? this.password,
      description: description ?? this.description,
      percentage: percentage ?? this.percentage,
      image: image ?? this.image,
      images: images ?? this.images,
      followersCount: followersCount ?? this.followersCount,
      isFollowed: isFollowed ?? this.isFollowed,
    );
  }

  factory Advert.fromJson(Map<String, dynamic> json){
    return Advert(
      officePropertyId: json["office_property_id"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
      isActive: json["is_active"],
      createdTime: json["created_time"],
      propertyId: json["property_id"],
      userId: json["user_id"],
      regionId: json["region_id"],
      title: json["title"],
      contractType: json["contract_type"],
      propertyType: json["property_type"],
      descriptionProperty: json["description_property"],
      descriptionLocation: json["description_location"],
      officeId: json["office_id"],
      officeName: json["office_name"],
      email: json["email"],
      password: json["password"],
      description: json["description"],
      percentage: json["percentage"],
      image: json["image"],
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      followersCount: json["followers_count"],
      isFollowed: json["is_followed"],
    );
  }

}

class AlProperty {
  AlProperty({
    required this.officePropertyId,
    required this.status,
    required this.price,
    required this.propertyId,
    required this.userId,
    required this.regionId,
    required this.title,
    required this.contractType,
    required this.propertyType,
    required this.descriptionProperty,
    required this.descriptionLocation,
    required this.space,
    required this.officeId,
    required this.officeName,
    required this.email,
    required this.password,
    required this.description,
    required this.percentage,
    required this.image,
    required this.regionName,
    required this.stateId,
    required this.stateName,
    required this.images,
    required this.isFavorite,
    required this.followersCount,
    required this.isFollowed,
  });

  final int? officePropertyId;
  final String? status;
  final String? price;
  final int? propertyId;
  final int? userId;
  final int? regionId;
  final String? title;
  final String? contractType;
  final String? propertyType;
  final String? descriptionProperty;
  final String? descriptionLocation;
  final int? space;
  final int? officeId;
  final String? officeName;
  final String? email;
  final String? password;
  final String? description;
  final String? percentage;
  final String? image;
  final String? regionName;
  final int? stateId;
  final String? stateName;
  final List<String> images;
  final bool? isFavorite;
  final int? followersCount;
  final bool? isFollowed;

  AlProperty copyWith({
    int? officePropertyId,
    String? status,
    String? price,
    int? propertyId,
    int? userId,
    int? regionId,
    String? title,
    String? contractType,
    String? propertyType,
    String? descriptionProperty,
    String? descriptionLocation,
    int? space,
    int? officeId,
    String? officeName,
    String? email,
    String? password,
    String? description,
    String? percentage,
    String? image,
    String? regionName,
    int? stateId,
    String? stateName,
    List<String>? images,
    bool? isFavorite,
    int? followersCount,
    bool? isFollowed,
  }) {
    return AlProperty(
      officePropertyId: officePropertyId ?? this.officePropertyId,
      status: status ?? this.status,
      price: price ?? this.price,
      propertyId: propertyId ?? this.propertyId,
      userId: userId ?? this.userId,
      regionId: regionId ?? this.regionId,
      title: title ?? this.title,
      contractType: contractType ?? this.contractType,
      propertyType: propertyType ?? this.propertyType,
      descriptionProperty: descriptionProperty ?? this.descriptionProperty,
      descriptionLocation: descriptionLocation ?? this.descriptionLocation,
      space: space ?? this.space,
      officeId: officeId ?? this.officeId,
      officeName: officeName ?? this.officeName,
      email: email ?? this.email,
      password: password ?? this.password,
      description: description ?? this.description,
      percentage: percentage ?? this.percentage,
      image: image ?? this.image,
      regionName: regionName ?? this.regionName,
      stateId: stateId ?? this.stateId,
      stateName: stateName ?? this.stateName,
      images: images ?? this.images,
      isFavorite: isFavorite ?? this.isFavorite,
      followersCount: followersCount ?? this.followersCount,
      isFollowed: isFollowed ?? this.isFollowed,
    );
  }

  factory AlProperty.fromJson(Map<String, dynamic> json){
    return AlProperty(
      officePropertyId: json["office_property_id"],
      status: json["status"],
      price: json["price"],
      propertyId: json["property_id"],
      userId: json["user_id"],
      regionId: json["region_id"],
      title: json["title"],
      contractType: json["contract_type"],
      propertyType: json["property_type"],
      descriptionProperty: json["description_property"],
      descriptionLocation: json["description_location"],
      space: json["space"],
      officeId: json["office_id"],
      officeName: json["office_name"],
      email: json["email"],
      password: json["password"],
      description: json["description"],
      percentage: json["percentage"],
      image: json["image"],
      regionName: json["region_Name"],
      stateId: json["state_id"],
      stateName: json["state_name"],
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      isFavorite: json["is_favorite"],
      followersCount: json["followers_count"],
      isFollowed: json["is_followed"],
    );
  }

}

class Office {
  Office({
    required this.id,
    required this.officeName,
    required this.email,
    required this.description,
    required this.password,
    required this.percentage,
    required this.image,
    required this.followersCount,
    required this.isFollowed,
  });

  final int? id;
  final String? officeName;
  final String? email;
  final String? description;
  final String? password;
  final String? percentage;
  final String? image;
  final int? followersCount;
  final bool? isFollowed;

  Office copyWith({
    int? id,
    String? officeName,
    String? email,
    String? description,
    String? password,
    String? percentage,
    String? image,
    int? followersCount,
    bool? isFollowed,
  }) {
    return Office(
      id: id ?? this.id,
      officeName: officeName ?? this.officeName,
      email: email ?? this.email,
      description: description ?? this.description,
      password: password ?? this.password,
      percentage: percentage ?? this.percentage,
      image: image ?? this.image,
      followersCount: followersCount ?? this.followersCount,
      isFollowed: isFollowed ?? this.isFollowed,
    );
  }

  factory Office.fromJson(Map<String, dynamic> json){
    return Office(
      id: json["id"],
      officeName: json["office_name"],
      email: json["email"],
      description: json["description"],
      password: json["password"],
      percentage: json["percentage"],
      image: json["image"],
      followersCount: json["followers_count"],
      isFollowed: json["is_followed"],
    );
  }

}

class StateJson {
  StateJson({
    required this.id,
    required this.stateName,
  });

  final int? id;
  final String? stateName;

  StateJson copyWith({
    int? id,
    String? stateName,
  }) {
    return StateJson(
      id: id ?? this.id,
      stateName: stateName ?? this.stateName,
    );
  }

  factory StateJson.fromJson(Map<String, dynamic> json){
    return StateJson(
      id: json["id"],
      stateName: json["state_name"],
    );
  }

}
