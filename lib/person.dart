import 'package:flutter/material.dart';

class Person {
  final String name;
  int age;
  Person(this.name, this.age);

  void birthday() {
    debugPrint("birthday");
    age++;
  }

  @override
  String toString() => 'Person(name: $name, age: $age)';
}
