class UserModel {
  String id;
  String name;
  String email;
  String phone;
  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone});
  factory UserModel.fromJson(Map<String, dynamic> obj) {
    return UserModel(
        id: obj["id"],
        name: obj["name"],
        email: obj["email"],
        phone: obj["phone"]);
  }
}
