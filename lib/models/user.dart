class User {
  String? id;
  String? email;
  String? name;
  String? phone;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
  });

  User copy({
    String? id,
    String? name,
    String? phone,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        phone: phone ?? this.phone,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        email: json['email'],
        name: json['name'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'phone': phone,
      };
}
