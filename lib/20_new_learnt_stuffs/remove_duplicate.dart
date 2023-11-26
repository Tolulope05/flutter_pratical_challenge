class Person {
  String name;

  Person({required this.name});

  @override
  String toString() {
    return 'Person{name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

List<Person> removeDuplicate(List<Person> persons) {
  return persons.toSet().toList();
}

void main() {
  List<Person> persons = [
    Person(name: 'A'),
    Person(name: 'B'),
    Person(name: 'C'),
    Person(name: 'A'),
    Person(name: 'B'),
    Person(name: 'C'),
    Person(name: 'A'),
    Person(name: 'B'),
    Person(name: 'C'),
  ];

  print(removeDuplicate(persons));

  // Output: [Person{name: A}, Person{name: B}, Person{name: C}]
}
