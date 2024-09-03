class UserModel {
  final String id;
  final String? imageUrl;
  final String email;
  final String firstName;
  final String lastName;
  final DateTime createdAt;
  final String authBy;

  UserModel(
      {required this.id,
      required this.imageUrl,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.createdAt,
      required this.authBy});

  UserModel copyWith({
    String? id,
    String? imageUrl,
    String? email,
    String? firstName,
    String? lastName,
    DateTime? createdAt,
    String? authBy,
  }) {
    return UserModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      createdAt: createdAt ?? this.createdAt,
      authBy: authBy ?? this.authBy,
    );
  }
}
