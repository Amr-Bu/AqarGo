class StateModel {
  StateModel({
    required this.id,
    required this.stateName,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? stateName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  StateModel copyWith({
    int? id,
    String? stateName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StateModel(
      id: id ?? this.id,
      stateName: stateName ?? this.stateName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory StateModel.fromJson(Map<String, dynamic> json){
    return StateModel(
      id: json["id"],
      stateName: json["state_name"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}
