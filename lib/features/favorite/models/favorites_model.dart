class FavoritesModel {
  FavoritesModel({
    required this.message,
    required this.favorites,
  });
  late final String? message;
  late final List<Favorites>? favorites;

  FavoritesModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    favorites = List.from(json['favorites']).map((e)=>Favorites.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['favorites'] = favorites!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Favorites {
  Favorites({
    required this.id,
    required this.price,
    required this.status,
    required this.isFeatured,
    required this.propertyId,
    required this.officeId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.property,
  });
  late final int? id;
  late final String? price;
  late final String? status;
  late final int? isFeatured;
  late final int? propertyId;
  late final int? officeId;
  late final dynamic createdAt;
  late final dynamic updatedAt;
  late final Pivot? pivot;
  late final Property? property;

  Favorites.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    status = json['status'];
    isFeatured = json['is_featured'];
    propertyId = json['property_id'];
    officeId = json['office_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = Pivot.fromJson(json['pivot']);
    property = Property.fromJson(json['property']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['price'] = price;
    _data['status'] = status;
    _data['is_featured'] = isFeatured;
    _data['property_id'] = propertyId;
    _data['office_id'] = officeId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pivot'] = pivot!.toJson();
    _data['property'] = property!.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.userId,
    required this.officePropertyId,
  });
  late final int? userId;
  late final int? officePropertyId;

  Pivot.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    officePropertyId = json['office_property_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['office_property_id'] = officePropertyId;
    return _data;
  }
}

class Property {
  Property({
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
    required this.region,
    required this.images,
  });
  late final int? id;
  late final int? userId;
  late final int? regionId;
  late final int? price;
  late final int? space;
  late final String? descriptionProperty;
  late final String? title;
  late final String? descriptionLocation;
  late final String? contractType;
  late final String? propertyCategory;
  late final String? propertyType;
  late final String? createdAt;
  late final String? updatedAt;
  late final Region? region;
  late final List<Images>? images;

  Property.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    regionId = json['region_id'];
    price = json['price'];
    space = json['space'];
    descriptionProperty = json['description_property'];
    title = json['title'];
    descriptionLocation = json['description_location'];
    contractType = json['contract_type'];
    propertyCategory = json['property_category'];
    propertyType = json['property_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    region = Region.fromJson(json['region']);
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['region_id'] = regionId;
    _data['price'] = price;
    _data['space'] = space;
    _data['description_property'] = descriptionProperty;
    _data['title'] = title;
    _data['description_location'] = descriptionLocation;
    _data['contract_type'] = contractType;
    _data['property_category'] = propertyCategory;
    _data['property_type'] = propertyType;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['region'] = region!.toJson();
    _data['images'] = images!.map((e)=>e.toJson()).toList();
    return _data;
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
  late final int? id;
  late final String? regionName;
  late final int? stateId;
  late final String? createdAt;
  late final String? updatedAt;
  late final State? state;

  Region.fromJson(Map<String, dynamic> json){
    id = json['id'];
    regionName = json['region_Name'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    state = State.fromJson(json['state']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['region_Name'] = regionName;
    _data['state_id'] = stateId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['state'] = state!.toJson();
    return _data;
  }
}

class State {
  State({
    required this.id,
    required this.stateName,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int? id;
  late final String? stateName;
  late final String? createdAt;
  late final String? updatedAt;

  State.fromJson(Map<String, dynamic> json){
    id = json['id'];
    stateName = json['state_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['state_name'] = stateName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Images {
  Images({
    required this.propertyId,
    required this.imagePath,
  });
  late final int? propertyId;
  late final String? imagePath;

  Images.fromJson(Map<String, dynamic> json){
    propertyId = json['property_id'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['property_id'] = propertyId;
    _data['image_path'] = imagePath;
    return _data;
  }
}