class UserDetailsModel {
  final String name;
  final String phone;
  UserDetailsModel({required this.name, required this.phone});

  Map<String, dynamic> getJson() => {
        'name': name,
        'Phone': phone,
      };

  factory UserDetailsModel.getModelFromJson(Map<String, dynamic> json) {
    return UserDetailsModel(name: json["name"], phone: json["phone"]);
  }
}
