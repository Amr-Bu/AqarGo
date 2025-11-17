class OfficeModel {
  OfficeModel({
    required this.id,
    required this.officeName,
    required this.email,
    required this.description,
    required this.phoneNumberOffice,
    required this.percentage,
    required this.image,
  });

  final int? id;
  final String? officeName;
  final String? email;
  final String? description;
  final String? phoneNumberOffice;
  final String? percentage;
  final dynamic image;

  OfficeModel copyWith({
    int? id,
    String? officeName,
    String? email,
    String? description,
    String? phoneNumberOffice,
    String? percentage,
    dynamic? image,
  }) {
    return OfficeModel(
      id: id ?? this.id,
      officeName: officeName ?? this.officeName,
      email: email ?? this.email,
      description: description ?? this.description,
      phoneNumberOffice: phoneNumberOffice ?? this.phoneNumberOffice,
      percentage: percentage ?? this.percentage,
      image: image ?? this.image,
    );
  }

  factory OfficeModel.fromJson(Map<String, dynamic> json){
    return OfficeModel(
      id: json["id"],
      officeName: json["Office_name"],
      email: json["email"],
      description: json["description"],
      phoneNumberOffice: json["PhoneNumberOffice"],
      percentage: json["percentage"],
      image: json["image"],
    );
  }

}
