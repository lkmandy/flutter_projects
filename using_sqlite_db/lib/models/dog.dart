class Dog {
  final int id;
  final int age;
  final String name;

  Dog({required this.id, required this.age, required this.name});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'age': age,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}