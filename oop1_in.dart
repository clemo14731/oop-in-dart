import 'dart:io';

// Define an interface
abstract class Shape {
  void draw();
}

// Implement the interface with a class
class Circle implements Shape {
  @override
  void draw() {
    print('Drawing a circle');
  }
}

// Create a base class with an inherited method
class Animal {
  void makeSound() {
    print('Animal makes a sound');
  }
}

// Create a derived class that overrides the inherited method
class Dog extends Animal {
  @override
  void makeSound() {
    print('Dog barks');
  }
}

// Define a class that reads data from a file and initializes an instance
class Person {
  late String name = '';
  late int age = 0;

  Person(String fileName) {
    readFile(fileName);
  }

  void readFile(String fileName) {
    try {
      File file = File(fileName);
      List<String> lines = file.readAsLinesSync();
      name = lines[0];
      age = int.parse(lines[1]);
    } catch (e) {
      print('Error reading file: $e');
    }
  }

  void display() {
    if (name.isNotEmpty && age != 0) {
      print('Name: $name, Age: $age');
    } else {
      print('Person data is not available');
    }
  }
}

// Demonstrate the use of a loop
void printNumbers(int n) {
  for (int i = 1; i <= n; i++) {
    print(i);
  }
}

void main() {
  // Create the data.txt file with sample data
  File dataFile = File('data.txt');
  dataFile.writeAsStringSync('Clement Juma\n24\n');

  // Create an instance of a class initialized with data from a file
  var person = Person('data.txt');
  person.display();

  // Create an instance of a class that implements an interface
  var circle = Circle();
  circle.draw();

  // Create an instance of a class that overrides an inherited method
  var dog = Dog();
  dog.makeSound();

  // Demonstrate the use of a loop
  printNumbers(5);
}
