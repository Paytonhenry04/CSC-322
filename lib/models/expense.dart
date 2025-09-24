import "package:uuid/uuid.dart";

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
} //allows a custom type that has predetermined values

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  //generates a unique id when initailized

  final String id;
  final String title;
  final double amount;
  final DateTime date; //a provided data type
  final Category category;
}
