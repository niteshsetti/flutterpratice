class Dog {
  late final int id;
  late final String name;
  late final int age;
  Dog(this.id, this.name, this.age);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
