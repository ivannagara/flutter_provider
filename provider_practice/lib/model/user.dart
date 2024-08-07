class User {
  const User({
    this.id = '421131254122141',
    this.name = 'Captain America',
    this.description = 'The first avenger',
  });

  final String id;
  final String name;
  final String description;

  User copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
