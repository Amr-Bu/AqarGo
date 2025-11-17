class PropertyAreaModel {
  PropertyAreaModel({
    required this.propertyId,
    required this.title,
    required this.contractType,
    required this.propertyType,
    required this.descriptionProperty,
    required this.descriptionLocation,
    required this.space,
    required this.regionId,
    required this.regionName,
    required this.stateId,
    required this.stateName,
    required this.images,
    required this.officePropertyId,
    required this.officeId,
    required this.OfficeName,
    required this.PhoneNumberOffice,
    required this.email,
    required this.isFavorite,
  });
  late final int propertyId;
  late final String title;
  late final String contractType;
  late final String propertyType;
  late final String descriptionProperty;
  late final String descriptionLocation;
  late final int space;
  late final int regionId;
  late final String regionName;
  late final int stateId;
  late final String stateName;
  late final List<String> images;
  late final int officePropertyId;
  late final int officeId;
  late final String OfficeName;
  late final String PhoneNumberOffice;
  late final String email;
  late final bool isFavorite;

  PropertyAreaModel.fromJson(Map<String, dynamic> json){
    propertyId = json['property_id'];
    title = json['title'];
    contractType = json['contract_type'];
    propertyType = json['property_type'];
    descriptionProperty = json['description_property'];
    descriptionLocation = json['description_location'];
    space = json['space'];
    regionId = json['region_id'];
    regionName = json['region_name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    images = List.castFrom<dynamic, String>(json['images']);
    officePropertyId = json['office_property_id'];
    officeId = json['office_id'];
    OfficeName = json['Office_name'];
    PhoneNumberOffice = json['PhoneNumberOffice'];
    email = json['email'];
    isFavorite = json['is_favorite'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['property_id'] = propertyId;
    _data['title'] = title;
    _data['contract_type'] = contractType;
    _data['property_type'] = propertyType;
    _data['description_property'] = descriptionProperty;
    _data['description_location'] = descriptionLocation;
    _data['space'] = space;
    _data['region_id'] = regionId;
    _data['region_name'] = regionName;
    _data['state_id'] = stateId;
    _data['state_name'] = stateName;
    _data['images'] = images;
    _data['office_property_id'] = officePropertyId;
    _data['office_id'] = officeId;
    _data['Office_name'] = OfficeName;
    _data['PhoneNumberOffice'] = PhoneNumberOffice;
    _data['email'] = email;
    _data['is_favorite'] = isFavorite;
    return _data;
  }
}