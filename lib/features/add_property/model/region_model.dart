class RegionModel {
  RegionModel({
    required this.id,
    required this.regionName,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? regionName;
  final int? stateId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  RegionModel copyWith({
    int? id,
    String? regionName,
    int? stateId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RegionModel(
      id: id ?? this.id,
      regionName: regionName ?? this.regionName,
      stateId: stateId ?? this.stateId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory RegionModel.fromJson(Map<String, dynamic> json){
    return RegionModel(
      id: json["id"],
      regionName: json["region_Name"],
      stateId: json["state_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
