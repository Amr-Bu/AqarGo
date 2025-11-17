class AreaModel {
  AreaModel({
    required this.id,
    required this.regionName,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String regionName;
  late final int stateId;
  late final String createdAt;
  late final String updatedAt;

  AreaModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    regionName = json['region_Name'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['region_Name'] = regionName;
    _data['state_id'] = stateId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}