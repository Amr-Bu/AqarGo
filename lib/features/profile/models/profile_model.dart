class ProfileModel {
  ProfileModel({
    required this.user,
  });
  late final User user;

  ProfileModel.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.FirstName,
    required this.LastName,
    required this.PhoneNumber,
    required this.email,
    this.emailVerifiedAt,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.properties,
    required this.followedOffices,
  });
  late final int id;
  late final String FirstName;
  late final String LastName;
  late final String PhoneNumber;
  late final String email;
  late final Null emailVerifiedAt;
  late final dynamic image;
  late final String createdAt;
  late final String updatedAt;
  late final List<Properties> properties;
  late final List<FollowedOffices> followedOffices;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    FirstName = json['FirstName'];
    LastName = json['LastName'];
    PhoneNumber = json['PhoneNumber'];
    email = json['email'];
    emailVerifiedAt = null;
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    properties = List.from(json['properties']).map((e)=>Properties.fromJson(e)).toList();
    followedOffices = List.from(json['followed_offices']).map((e)=>FollowedOffices.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['FirstName'] = FirstName;
    _data['LastName'] = LastName;
    _data['PhoneNumber'] = PhoneNumber;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['properties'] = properties.map((e)=>e.toJson()).toList();
    _data['followed_offices'] = followedOffices.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Properties {
  Properties({
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
  });
  late final int id;
  late final int userId;
  late final int regionId;
  late final int price;
  late final int space;
  late final String descriptionProperty;
  late final String title;
  late final String descriptionLocation;
  late final String contractType;
  late final String propertyCategory;
  late final String propertyType;
  late final String createdAt;
  late final String updatedAt;
  late final List<Images> images;
  late final Region region;

  Properties.fromJson(Map<String, dynamic> json){
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
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
    region = Region.fromJson(json['region']);
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
    _data['images'] = images.map((e)=>e.toJson()).toList();
    _data['region'] = region.toJson();
    return _data;
  }
}

class Images {
  Images({
    required this.propertyId,
    required this.imagePath,
  });
  late final int propertyId;
  late final String imagePath;

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

class Region {
  Region({
    required this.id,
    required this.regionName,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
    required this.state,
  });
  late final int id;
  late final String regionName;
  late final int stateId;
  late final String createdAt;
  late final String updatedAt;
  late final State state;

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
    _data['state'] = state.toJson();
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
  late final int id;
  late final String stateName;
  late final String createdAt;
  late final String updatedAt;

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

class FollowedOffices {
  FollowedOffices({
    required this.id,
    required this.OfficeName,
    required this.email,
    this.emailVerifiedAt,
    required this.description,
    required this.PhoneNumberOffice,
    required this.password,
    required this.percentage,
    this.image,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });
  late final int id;
  late final String OfficeName;
  late final String email;
  late final Null emailVerifiedAt;
  late final String description;
  late final String PhoneNumberOffice;
  late final String password;
  late final String percentage;
  late final String? image;
  late final Null rememberToken;
  late final String createdAt;
  late final String updatedAt;
  late final Pivot pivot;

  FollowedOffices.fromJson(Map<String, dynamic> json){
    id = json['id'];
    OfficeName = json['Office_name'];
    email = json['email'];
    emailVerifiedAt = null;
    description = json['description'];
    PhoneNumberOffice = json['PhoneNumberOffice'];
    password = json['password'];
    percentage = json['percentage'];
    image = null;
    rememberToken = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = Pivot.fromJson(json['pivot']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['Office_name'] = OfficeName;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['description'] = description;
    _data['PhoneNumberOffice'] = PhoneNumberOffice;
    _data['password'] = password;
    _data['percentage'] = percentage;
    _data['image'] = image;
    _data['remember_token'] = rememberToken;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['pivot'] = pivot.toJson();
    return _data;
  }
}

class Pivot {
  Pivot({
    required this.userId,
    required this.officeId,
  });
  late final int userId;
  late final int officeId;

  Pivot.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    officeId = json['office_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['office_id'] = officeId;
    return _data;
  }
}