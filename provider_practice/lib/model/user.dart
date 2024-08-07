class User {
  const User({
    this.id = '421131254122141',
    this.name = 'Captain America',
    this.description = 'The first avenger',
    this.email = '',
  });

  final String id;
  final String name;
  final String description;
  final String email;

  static User fromJson(Map<String, dynamic> data) {
    return User(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'email': email,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? description,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      email: email ?? this.email,
    );
  }
}
