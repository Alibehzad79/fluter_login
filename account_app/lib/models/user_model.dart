class UserModel {
  String refresh;
  String access;

  UserModel({
    required this.refresh,
    required this.access,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      refresh: json['refresh'],
      access: json['access'],
    );
  }
}
