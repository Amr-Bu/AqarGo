class SearchModel {
  SearchModel({
    required this.data,
  });
  late final List<Data> data;

  SearchModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.property,
    required this.office,
  });
  late final Property property;
  late final Office office;

  Data.fromJson(Map<String, dynamic> json){
    property = Property.fromJson(json['property']);
    office = Office.fromJson(json['office']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['property'] = property.toJson();
    _data['office'] = office.toJson();
    return _data;
  }
}

class Property {
  Property({
    required this.id,
    required this.title,
    required this.descriptionProperty,
    required this.price,
    required this.space,
    required this.contractType,
    required this.propertyCategory,
    required this.propertyType,
    required this.regionId,
    required this.regionName,
    required this.stateId,
    required this.stateName,
    required this.images,
    required this.isFavorite,
  });
  late final int id;
  late final String title;
  late final String descriptionProperty;
  late final int price;
  late final int space;
  late final String contractType;
  late final String propertyCategory;
  late final String propertyType;
  late final int regionId;
  late final String regionName;
  late final int stateId;
  late final String stateName;
  late final List<String> images;
  late final bool isFavorite;

  Property.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    descriptionProperty = json['description_property'];
    price = json['price'];
    space = json['space'];
    contractType = json['contract_type'];
    propertyCategory = json['property_category'];
    propertyType = json['property_type'];
    regionId = json['region_id'];
    regionName = json['region_Name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    images = List.castFrom<dynamic, String>(json['images']);
    isFavorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description_property'] = descriptionProperty;
    _data['price'] = price;
    _data['space'] = space;
    _data['contract_type'] = contractType;
    _data['property_category'] = propertyCategory;
    _data['property_type'] = propertyType;
    _data['region_id'] = regionId;
    _data['region_Name'] = regionName;
    _data['state_id'] = stateId;
    _data['state_name'] = stateName;
    _data['images'] = images;
    _data['is_favorite'] = isFavorite;
    return _data;
  }
}

class Office {
  Office({
    required this.officePropertyId,
    required this.id,
    required this.OfficeName,
    required this.email,
    required this.description,
    required this.percentage,
    this.image,
    required this.PhoneNumberOffice,
    required this.price,
    required this.status,
    required this.isFeatured,
  });
  late final int officePropertyId;
  late final int id;
  late final String OfficeName;
  late final String email;
  late final String description;
  late final String percentage;
  late final String? image;
  late final String PhoneNumberOffice;
  late final String price;
  late final String status;
  late final int isFeatured;

  Office.fromJson(Map<String, dynamic> json){
    officePropertyId = json['office_property_id'];
    id = json['id'];
    OfficeName = json['Office_name'];
    email = json['email'];
    description = json['description'];
    percentage = json['percentage'];
    image = null;
    PhoneNumberOffice = json['PhoneNumberOffice'];
    price = json['price'];
    status = json['status'];
    isFeatured = json['is_featured'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['office_property_id'] = officePropertyId;
    _data['id'] = id;
    _data['Office_name'] = OfficeName;
    _data['email'] = email;
    _data['description'] = description;
    _data['percentage'] = percentage;
    _data['image'] = image;
    _data['PhoneNumberOffice'] = PhoneNumberOffice;
    _data['price'] = price;
    _data['status'] = status;
    _data['is_featured'] = isFeatured;
    return _data;
  }
}